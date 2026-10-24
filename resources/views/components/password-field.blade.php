{{-- Komponen input password dengan tombol tampilkan/sembunyikan sandi (ikon mata).
    Penggunaan: <x-password-field name="password" label="Password" required /> --}}
@props([
    'name',
    'label' => 'Password',
    'required' => false,
    'value' => null,
])

<div>
    @if(trim($label))
    <label for="{{ $name }}" class="block text-xs font-medium text-gray-500 mb-1">{{ $label }}@if($required) <span class="text-red-300">*</span>@endif</label>
    @endif
    <div x-data="{ show: false }" class="relative">
        {{-- type awal tetap password; Alpine yang mengubah type saat tombol mata ditekan --}}
        <input type="password"
               :type="show ? 'text' : 'password'"
               id="{{ $name }}"
               name="{{ $name }}"
               value="{{ $value }}"
               @if($required) required @endif
               class="w-full px-3 py-2.5 pr-10 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors">
        <button type="button"
                @click="show = !show"
                :aria-label="show ? 'Sembunyikan sandi' : 'Tampilkan sandi'"
                :title="show ? 'Sembunyikan sandi' : 'Tampilkan sandi'"
                class="absolute inset-y-0 right-0 flex items-center px-3 text-gray-400 hover:text-gray-700 cursor-pointer transition-colors">
            {{-- Mata: tampilkan sandi --}}
            <svg x-show="!show" class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
            {{-- Mata dicoret: sembunyikan sandi --}}
            <svg x-show="show" style="display:none" class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.542-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l-4.615-4.615M14.121 14.121l4.616 4.616M21.542 12a9.97 9.97 0 00-1.563-3.029m-3.357-2.936a9.97 9.97 0 00-4.622-2.03"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 3l18 18"></path></svg>
        </button>
    </div>
</div>
