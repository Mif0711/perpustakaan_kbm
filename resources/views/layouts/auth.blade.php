<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'Perpus Zabitsa') }} - @yield('title', 'Login')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        /* Matikan tombol tampilkan sandi bawaan Microsoft Edge agar tidak dobel dengan tombol mata aplikasi */
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear {
            display: none;
        }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen text-gray-900 p-4">
    <div class="w-full max-w-md p-8 space-y-6 bg-white border border-gray-100 rounded-lg shadow-sm">
        @yield('content')
    </div>
</body>
</html>