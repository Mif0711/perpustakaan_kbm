<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

/**
 * Pengujian sistem registrasi, validasi, dan penentuan role oleh Admin.
 */
class AccountApprovalTest extends TestCase
{
    use RefreshDatabase;

    private function registrationData(array $overrides = []): array
    {
        return array_merge([
            'name' => 'Pendaftar Baru',
            'username' => 'pendaftar01',
            'email' => 'pendaftar01@example.com',
            'telepon' => '081234567890',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ], $overrides);
    }

    private function makeAdmin(): User
    {
        return User::factory()->create([
            'role' => 'admin',
            'status' => 'approved',
            'password' => bcrypt('password123'),
        ]);
    }

    private function makePetugas(): User
    {
        return User::factory()->create([
            'role' => 'petugas',
            'status' => 'approved',
            'password' => bcrypt('password123'),
        ]);
    }

    // ===== 1. Registrasi =====

    public function test_registrasi_baru_dibuat_dengan_status_pending_dan_role_sementara(): void
    {
        $response = $this->post(route('register.post'), $this->registrationData());

        $user = User::where('username', 'pendaftar01')->firstOrFail();
        $this->assertSame('pending', $user->status);
        $this->assertSame('anggota', $user->role); // role sementara, final ditentukan Admin
        $this->assertDatabaseHas('users', ['username' => 'pendaftar01', 'status' => 'pending']);
        $response->assertRedirect(route('login'));
        $response->assertSessionHas('success');
    }

    public function test_mendengarkan_perubahan_role_melalui_formulir_registrasi_ditolak(): void
    {
        // Pendaftar mencoba menyelundupkan role melalui payload
        $this->post(route('register.post'), array_merge(
            $this->registrationData(),
            ['role' => 'admin', 'status' => 'approved']
        ));

        $user = User::where('username', 'pendaftar01')->firstOrFail();
        $this->assertNotSame('admin', $user->role);
        $this->assertSame('pending', $user->status);
    }

    public function test_username_duplikat_ditolak(): void
    {
        User::factory()->create(['username' => 'pendaftar01']);

        $this->post(route('register.post'), $this->registrationData())
            ->assertSessionHasErrors('username');
    }

    public function test_email_duplikat_ditolak(): void
    {
        User::factory()->create(['email' => 'pendaftar01@example.com']);

        $this->post(route('register.post'), $this->registrationData())
            ->assertSessionHasErrors('email');
    }

    public function test_konfirmasi_password_tidak_sama_ditolak(): void
    {
        $this->post(route('register.post'), $this->registrationData([
            'password_confirmation' => 'berbeda123',
        ]))->assertSessionHasErrors('password');
    }

    public function test_password_disimpan_dalam_bentuk_hash(): void
    {
        $this->post(route('register.post'), $this->registrationData());

        $user = User::where('username', 'pendaftar01')->firstOrFail();
        $this->assertNotSame('password123', $user->password);
        $this->assertStringNotContainsString('password123', $user->password);
    }

    // ===== 2. Login sebelum disetujui =====

    public function test_akun_pending_tidak_bisa_login(): void
    {
        User::factory()->create([
            'username' => 'pendinguser',
            'password' => bcrypt('password123'),
            'status' => 'pending',
        ]);

        $this->post(route('login.post'), ['login' => 'pendinguser', 'password' => 'password123'])
            ->assertSessionHas('error')
            ->assertRedirect();

        $this->assertGuest();
    }

    public function test_akun_rejected_tidak_bisa_login(): void
    {
        User::factory()->create([
            'username' => 'rejecteduser',
            'password' => bcrypt('password123'),
            'status' => 'rejected',
        ]);

        $this->post(route('login.post'), ['login' => 'rejecteduser', 'password' => 'password123'])
            ->assertSessionHas('error')
            ->assertRedirect();

        $this->assertGuest();
    }

    // ===== 3. Akses halaman & endpoint =====

    public function test_admin_dapat_melihat_daftar_akun_pending(): void
    {
        $admin = $this->makeAdmin();
        User::factory()->create(['status' => 'pending', 'name' => 'Pendaftar Menunggu']);

        $this->actingAs($admin)
            ->get(route('admin.users.pending'))
            ->assertOk()
            ->assertSee('Pendaftar Menunggu');
    }

    public function test_petugas_tidak_bisa_menyetujui_pendaftaran(): void
    {
        $petugas = User::factory()->create(['role' => 'petugas', 'status' => 'approved']);
        $pending = User::factory()->create(['status' => 'pending']);

        $this->actingAs($petugas)
            ->post(route('admin.users.approve', $pending), ['role' => 'anggota'])
            ->assertForbidden();

        $this->assertSame('pending', $pending->fresh()->status);
    }

    public function test_tamu_tidak_bisa_mengakses_endpoint_validasi_akun(): void
    {
        $pending = User::factory()->create(['status' => 'pending']);

        $this->get(route('admin.users.pending'))->assertRedirect(route('login'));
        $this->post(route('admin.users.approve', $pending), ['role' => 'admin'])->assertRedirect(route('login'));
        $this->post(route('admin.users.reject', $pending), ['rejected_reason' => 'x'])->assertRedirect(route('login'));

        $this->assertGuest();
        $this->assertSame('pending', $pending->fresh()->status);
    }

    public function test_anggota_tidak_bisa_mengubah_role_sendiri(): void
    {
        $anggota = User::factory()->create(['role' => 'anggota', 'status' => 'approved']);

        $this->actingAs($anggota)
            ->put(route('admin.users.update', $anggota), [
                'name' => $anggota->name,
                'username' => $anggota->username,
                'email' => $anggota->email,
                'role' => 'admin',
                '_method' => 'PUT',
            ])
            ->assertForbidden();

        $this->assertSame('anggota', $anggota->fresh()->role);
    }

    // ===== 4. Persetujuan & penentuan role =====

    public function test_admin_disetujui_sebagai_role_petugas(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending']);

        $response = $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'petugas']);

        $fresh = $pending->fresh();
        $this->assertSame('approved', $fresh->status);
        $this->assertSame('petugas', $fresh->role);
        $this->assertSame($admin->id, $fresh->approved_by);
        $this->assertNotNull($fresh->approved_at);
        $response->assertSessionHas('success', fn ($msg) => str_contains($msg, 'Petugas'));
    }

    public function test_admin_disetujui_sebagai_admin(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending']);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'admin']);

        $fresh = $pending->fresh();
        $this->assertSame('approved', $fresh->status);
        $this->assertSame('admin', $fresh->role);
    }

    public function test_disetujui_sebagai_anggota_membuat_record_member(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending', 'telepon' => '08123456789']);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'anggota']);

        $fresh = $pending->fresh()->load('member');
        $this->assertSame('approved', $fresh->status);
        $this->assertNotNull($fresh->member_id);
        $this->assertSame($pending->telepon, $fresh->member->telepon);
        $this->assertSame('aktif', $fresh->member->status);
    }

    public function test_role_tidak_valid_ditolak(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending']);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'superadmin'])
            ->assertSessionHasErrors('role');

        $this->assertSame('pending', $pending->fresh()->status);
    }

    public function test_akun_yang_sudah_diproses_tidak_bisa_diproses_ulang(): void
    {
        $admin = $this->makeAdmin();
        $approved = User::factory()->create(['status' => 'approved', 'role' => 'anggota']);
        $originalRole = $approved->role;

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $approved), ['role' => 'petugas']);

        $fresh = $approved->fresh();
        $this->assertSame('approved', $fresh->status); // status tidak berubah
        $this->assertSame($originalRole, $fresh->role); // role tidak ikut berubah
    }

    public function test_penolakan_menyimpan_alasan_dan_admin(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending']);

        $this->actingAs($admin)
            ->post(route('admin.users.reject', $pending), ['rejected_reason' => 'Data tidak lengkap'])
            ->assertSessionHas('success');

        $fresh = $pending->fresh();
        $this->assertSame('rejected', $fresh->status);
        $this->assertSame('Data tidak lengkap', $fresh->rejected_reason);
        $this->assertNotNull($fresh->rejected_at);
    }

    // ===== 5. Aktivitas pasca-persetujuan =====

    public function test_akun_disetujui_bisa_login(): void
    {
        User::factory()->create([
            'username' => 'petugasbaru',
            'password' => bcrypt('password123'),
            'role' => 'petugas',
            'status' => 'approved',
        ]);

        $this->post(route('login.post'), ['login' => 'petugasbaru', 'password' => 'password123'])
            ->assertRedirect(route('petugas.dashboard'));

        $this->assertAuthenticated();
    }

    public function test_akun_admin_lama_tetap_bisa_login(): void
    {
        $admin = $this->makeAdmin();

        $this->post(route('login.post'), ['login' => $admin->username, 'password' => 'password123'])
            ->assertRedirect(route('admin.dashboard'));
    }

    public function test_akun_petugas_lama_tetap_bisa_login(): void
    {
        $petugas = $this->makePetugas();

        $this->post(route('login.post'), ['login' => $petugas->username, 'password' => 'password123'])
            ->assertRedirect(route('petugas.dashboard'));
    }

    public function test_perubahan_role_akun_aktif_tercatat_di_log_audit(): void
    {
        $admin = $this->makeAdmin();
        $otherAdmin = $this->makeAdmin(); // agar tidak memicu proteksi admin terakhir
        $petugas = User::factory()->create(['role' => 'petugas', 'status' => 'approved']);

        $response = $this->actingAs($admin)
            ->put(route('admin.users.update', $petugas), [
                'name' => $petugas->name,
                'username' => $petugas->username,
                'email' => $petugas->email,
                'role' => 'anggota',
            ]);

        // Pastikan update benar-benar berjalan (tidak gagal diam-diam)
        $response->assertRedirect(route('admin.users.index'));
        $this->assertSame('anggota', $petugas->fresh()->role);

        $this->assertDatabaseHas('account_validation_logs', [
            'user_id' => $petugas->id,
            'acted_by' => $admin->id,
            'action' => 'role_changed',
            'old_role' => 'petugas',
            'new_role' => 'anggota',
        ]);
        $this->assertNotNull($otherAdmin); // admin lain tetap ada
    }

    public function test_tidak_bisa_menurunkan_admin_aktif_terakhir(): void
    {
        $admin = $this->makeAdmin(); // satu-satunya admin aktif di sistem

        $this->actingAs($admin)
            ->put(route('admin.users.update', $admin), [
                'name' => $admin->name,
                'username' => $admin->username,
                'email' => $admin->email,
                'role' => 'petugas',
            ])
            ->assertRedirect();

        // Role tidak berubah agar sistem tetap memiliki akses administratif
        $this->assertSame('admin', $admin->fresh()->role);
        $this->assertDatabaseMissing('account_validation_logs', [
            'user_id' => $admin->id,
            'action' => 'role_changed',
        ]);
    }

    // ===== 6. Riwayat validasi =====

    public function test_persetujuan_tercatat_di_log_audit(): void
    {
        $admin = $this->makeAdmin();
        $pending = User::factory()->create(['status' => 'pending']);

        $this->actingAs($admin)
            ->post(route('admin.users.approve', $pending), ['role' => 'petugas']);

        $this->assertDatabaseHas('account_validation_logs', [
            'user_id' => $pending->id,
            'acted_by' => $admin->id,
            'action' => 'approved',
            'new_role' => 'petugas',
        ]);
    }
}
