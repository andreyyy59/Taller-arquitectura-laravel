@extends('emails.template')

@section('content')
    <a href="{{ config('app.url') }}/reset_password?token={{ $token }}">Click aquí para cambiar la contraseña.</a>
@endsection
