@extends('layout')

@section('title', __('models.debts'))

@section('body')
    <div class="wrapper my-3">

        @if (session()->has('message'))
            <div class="mb-2">{{ session('message') }}</div>
        @endif
        <h2>{{ __('actions.create') }} {{ __('models.debt') }}</h2>
        <div class="mt-3 box">

            <form method="POST" action="{{ route('debts.store') }}" role="form" enctype="multipart/form-data">
                @csrf
                <div class="box__section">
                    @include('debt.form')

                </div>
                <div class="box__section box__section--highlight row row--right">
                    <div class="row__column row__column--compact row__column--middle">
                        <a href="{{ route('debts.index') }}">{{ __('actions.cancel') }}</a>
                    </div>
                    <div class="row__column row__column--compact ml-2">
                        <button type="submit" class="button">{{ __('actions.create') }}</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
