@extends('layout')

@section('tailwind', true)

@section('title', 'Log in')

@section('body')
    <div class="max-w-sm mx-auto my-12">
        <img class="h-12 mx-auto mb-8" src="/logo.svg" />
        <div id="login-alert" class="hidden mb-4"></div>
        @if (session('alert_type') && session('alert_message'))
            @include('partials.alerts.' . session('alert_type'), ['payload' => ['classes' => 'mb-4', 'message' => session('alert_message')]])
        @endif
        <div class="p-5 bg-white border rounded-md">
            <form id="login-form" method="POST">
                {{ csrf_field() }}
                <div class="mb-5">
                    <label class="block mb-1 text-sm text-gray-700">E-mail</label>
                    <input class="w-full px-3 py-2 text-sm border rounded-md" type="email" name="email" id="email" value="{{ old('email') }}" autofocus required />
                </div>
                <div class="mb-5">
                    <label class="block mb-1 text-sm text-gray-700">Contraseña</label>
                    <input class="w-full px-3 py-2 text-sm border rounded-md" type="password" name="password" id="password" required />
                    <div class="mt-1 text-right">
                        <a href="{{ route('reset_password') }}" class="text-sm transition text-primary-regular hover:text-primary-dark">Olvidaste contraseña?</a>
                    </div>
                </div>
                <button type="submit" id="login-button" class="w-full py-2.5 hover:bg-primary-dark transition text-sm bg-primary-regular text-white rounded-md">Iniciar Sesión</button>
            </form>
        </div>
        <div class="mt-4 text-center">
            <a class="text-sm transition text-primary-regular hover:text-primary-dark" href="{{ route('register') }}">Primera Vez? Registrarse.</a>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        document.getElementById('login-form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const button = document.getElementById('login-button');
            const alertDiv = document.getElementById('login-alert');
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            button.disabled = true;
            button.innerText = 'Iniciando sesión...';
            alertDiv.classList.add('hidden');

            window.axios.post('/login', {
                email: email,
                password: password
            })
            .then(response => {
                window.location.href = '/dashboard';
            })
            .catch(error => {
                button.disabled = false;
                button.innerText = 'Iniciar Sesión';
                
                let message = 'Ocurrió un error inesperado.';
                if (error.response && error.response.data && error.response.data.message) {
                    message = error.response.data.message;
                } else if (error.response && error.response.status === 500) {
                    message = 'Error interno del servidor (500). Revisa la consola para más detalles.';
                }
                
                alertDiv.innerHTML = `<div class="p-4 text-sm text-red-700 bg-red-100 rounded-md">${message}</div>`;
                alertDiv.classList.remove('hidden');
                
                console.error('[Login Error Detail]', error.response ? error.response.data : error);
            });
        });
    </script>
@endsection
