<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

/**
 * Pengujian aturan kredensial opsional untuk akun ANGGOTA:
 * - Email & password opsional bagi anggota (registrasi & panel Admin).
 * - Wajib bagi Admin & Petugas.
 * - Petugas/Admin selalu memiliki email + password (termasuk saat menyetujui pendaftar).
 */
class MemberOptionalCredentialsTest extends TestCase
{
    use RefreshDatabase;

    private function makeAdmin(): User
    {
        return User::factory()->create([
            'role' => 'admin',
            'status' => 'approved',
            'password' => bcrypt('password123'),
        ]);
    }

    // ===== Registrasi publik =====

    public function test_registrasi_tanpa_email_dan_password_diterima_sebagai_anggota(): void
    {
        $this->post(route('register.post'), [
            'name' => 'Anggota Tanpa Email',
            'username' => 'tanpaemail01',
        ])->assertSessionHas('success');

        $user = User::where('username', 'tanpaemail01')->firstOrFail();
        $this->assertNull($user->email);
        $this->assertNull($user->password);
        $this->assertSame('pending', $user->status);
        $this->assertSame('anggota', $user->role);
    }

    public function test_registrasi_hanya_dengan_email_tanpa_password(): void
    {
        $this->post(route('register.post'), [
            'name' => 'Anggota Tanpa Password',
            'username' => 'tanpapass01',
            'email' => 'tanpapass01@example.com',
        ])->assertSessionHas('success');

        $user = User::where('username', 'tanpapass01')->firstOrFail();
        $this->assertSame('tanpapass01@example.com', $user->email);
        $this->assertNull($user->password);
    }

    public function test_registrasi_email_tidak_valid_ditolak(): void
    {
        $this->post(route('register.post'), [
            'name' => 'Email Salah Format',
            'username' => 'salahemail01',
            'email' => 'bukan-email',
        ])->assertSessionHasErrors('email');
    }

    // ===== Panel Admin: Tambah User =====

    public function test_admin_membuat_anggota_tanpa_email_dan_password(): void
    {
        $admin = $this->makeAdmin();

        $this->actingAs($admin)->post(route('admin.users.store'), [
            'name' => 'Anggota Admin',
            'username' => 'anggotaadmin01',
            'role' => 'anggota',
        ])->assertRedirect(route('admin.users.index'));

        $user = User::where('username', 'anggotaadmin01')->firstOrFail();
        $this->assertNull($user->email);
        $this->assertNull($user->password);
        $this->assertSame('approved', $user->status);
        $this->assertNotNull($user->member_id, 'Record anggota tetap otomatis dibuat.');
    }

    public function test_admin_tidak_bisa_membuat_petugas_tanpa_email_password(): void
    {
        $admin = $this->makeAdmin();
        $jumlahAwal = User::where('role', 'petugas')->count();

        $response = $this->actingAs($admin)->post(route('admin.users.store'), [
            'name' => 'Petugas Tanpa Kredensial',
            'username' => 'petugastanpa01',
            'role' => 'petugas',
        ]);

        $response->assertSessionHasErrors(['email', 'password']);
        $this->assertSame($jumlahAwal, User::where('role', 'petugas')->count());
    }

    public function test_admin_membuat_petugas_dengan_email_password_lengkap(): void
    {
        $admin = $this->makeAdmin();

        $this->actingAs($admin)->post(route('admin.users.store'), [
            'name' => 'Petugas Lengkap',
            'username' => 'petugasfull01',
            'email' => 'petugasfull01@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
            'role' => 'petugas',
        ])->assertRedirect(route('admin.users.index'));

        $user = User::where('username', 'petugasfull01')->firstOrFail();
        $this->assertNotNull($user->password);
        $this->assertSame('petugasfull01@example.com', $user->email);
    }

    // ===== Panel Admin: Edit User =====

    public function test_anggota_tanpa_email_dan_password_tidak_bisa_naik_ke_petugas(): void
    {
        $admin = $this->makeAdmin();
        $anggota = User::factory()->create([
            'username' => 'anggotatobypassing01',
            'email' => null,
            'password' => null,
            'role' => 'anggota',
            'status' => 'approved',
            'member_id' => null,
        ]);

        // Validasi email wajib untuk Admin/Petugas langsung menolak perubahan
        $this->actingAs($admin)->put(route('admin.users.update', $anggota), [
            'name' => $anggota->name,
            'username' => $anggota->username,
            'email' => null,
            'password' => null,
            'role' => 'petugas',
        ])->assertSessionHasErrors('email');

        $anggota->refresh();
        $this->assertSame('anggota', $anggota->role, 'Role tidak boleh berubah tanpa kredensial.');
    }

    public function test_anggota_beremail_tapi_tanpa_password_tidak_bisa_naik_ke_petugas(): void
    {
        $admin = $this->makeAdmin();
        $anggota = User::factory()->create([
            'username' => 'anggotaemailnopass01',
            'email' => 'anggotaemailnopass01@example.com',
            'password' => null,
            'role' => 'anggota',
            'status' => 'approved',
            'member_id' => null,
        ]);

        // Lolos validasi email, lalu ditahan guard password
        $response = $this->actingAs($admin)->put(route('admin.users.update', $anggota), [
            'name' => $anggota->name,
            'username' => $anggota->username,
            'email' => $anggota->email,
            'password' => null,
            'role' => 'petugas',
        ]);

        $response->assertRedirect(route('admin.users.edit', $anggota));
        $response->assertSessionHas('error');
        $anggota->refresh();
        $this->assertSame('anggota', $anggota->role, 'Role tidak boleh berubah tanpa password.');
    }

    // ===== Persetujuan pendaftar =====

    public function test_pendaftar_tanpa_kredensial_tidak_bisa_disetujui_sebagai_petugas(): void
    {
        $admin = $this->makeAdmin();

        $pending = User::factory()->create([
            'username' => 'pendingnopass01',
            'email' => null,
            'password' => null,
            'role' => 'anggota',
            'status' => 'pending',
        ]);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'petugas'])
            ->assertSessionHas('error');

        $pending->refresh();
        $this->assertSame('pending', $pending->status);
        $this->assertSame('anggota', $pending->role);
    }

    public function test_pendaftar_tanpa_kredensial_tetap_bisa_disetujui_sebagai_anggota(): void
    {
        $admin = $this->makeAdmin();

        $pending = User::factory()->create([
            'username' => 'pendingok01',
            'email' => null,
            'password' => null,
            'role' => 'anggota',
            'status' => 'pending',
        ]);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'anggota'])
            ->assertSessionHas('success');

        $pending->refresh();
        $this->assertSame('approved', $pending->status);
        $this->assertNotNull($pending->member_id, 'Record anggota dibuat saat persetujuan.');
    }

    // ===== Login =====

    public function test_anggota_tanpa_password_tidak_bisa_login_karena_kredensial_salah(): void
    {
        User::factory()->create([
            'username' => 'tanpalogin01',
            'email' => null,
            'password' => null,
            'role' => 'anggota',
            'status' => 'approved',
        ]);

        $this->post(route('login'), [
            'login' => 'tanpalogin01',
            'password' => 'password123',
        ])->assertSessionHas('error');
    }
}
