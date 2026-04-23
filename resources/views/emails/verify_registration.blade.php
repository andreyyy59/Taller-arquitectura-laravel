@extends('emails.template')

@section('content')
    Bienvenido a bordo, {{ $name }}

    Vamos a ayudarte a conocer mejor tus finanzas personales.

    Se acabó lidiar con molestas hojas de cálculo a medias.

    <a href="{{ route('verify', $verification_token) }}">Verify</a>
@endsection
