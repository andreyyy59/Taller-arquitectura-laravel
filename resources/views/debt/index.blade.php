@extends('layout')

@section('title', __('models.debts'))

@section('body')

    <div class="wrapper my-3">
        @if (session()->has('message'))
            <div class="mb-2">{{ session('message') }}</div>
        @endif
        <div class="row mb-3">
            <div class="row__column row__column--middle">
                <h2>{{ __('models.debts') }}</h2>
            </div>
            <div class="row__column row__column--compact row__column--middle">
                <a href="{{ route('debts.create') }}" class="button">{{ __('actions.create') }} {{ __('models.debt') }}</a>
            </div>
        </div>
        <div class="box">
            @if (count($debts))
                <div class="box__section box__section--header row">

                    <div class="row__column">{{ __('fields.type') }}</div>
                    <div class="row__column">{{ __('fields.amount') }}</div>
                    <div class="row__column">{{ __('fields.description') }}</div>

                    <div class="row__column"></div>
                </div>
                @foreach ($debts as $debt)
                    <div class="box__section row">


                        <div class="row__column row__column--middle" v-pre>{{ $debt->getTypeName() }}</div>
                        <div class="row__column row__column--middle" v-pre>

                            <a href="{{ route('debts.show', $debt->id) }}">

                                <label
                                    style="color: @switch($debt->type)
                                        @case(\App\Enums\TypeDebts::I_LEND->getId())
                                            #FF0000
                                        @break
                                        @case(\App\Enums\TypeDebts::LEND_ME->getId())
                                            #00FF00
                                        @break
                                    @endswitch">
                                    Total:
                                    @switch($debt->type)
                                        @case(\App\Enums\TypeDebts::I_LEND->getId())
                                            <i class="fas fa-arrow-alt-right fa-sm"></i>
                                        @break

                                        @case(\App\Enums\TypeDebts::LEND_ME->getId())
                                            <i class="fas fa-arrow-alt-left fa-sm"></i>
                                        @break

                                        @default
                                    @endswitch
                                    {{ $debt->amount }} </label>
                                <br>
                                <label
                                    style="color: @switch($debt->type)
                                        @case(\App\Enums\TypeDebts::I_LEND->getId())
                                             #00FF00
                                        @break
                                        @case(\App\Enums\TypeDebts::LEND_ME->getId())
                                            #FF0000
                                        @break
                                    @endswitch">
                                    Abono:
                                    @switch($debt->type)
                                        @case(\App\Enums\TypeDebts::I_LEND->getId())
                                            <i class="fas fa-arrow-alt-left fa-sm"></i>
                                        @break

                                        @case(\App\Enums\TypeDebts::LEND_ME->getId())
                                            <i class="fas fa-arrow-alt-right fa-sm"></i>
                                        @break

                                        @default
                                    @endswitch
                                    {{ $debt->getTotalPayments() }} </label><br>
                                <label>
                                    Saldo:
                                    {{ $debt->getTotalBalance() }} </label>



                            </a>
                        </div>
                        <div class="row__column row__column--middle" v-pre>
                            {{ $debt->Who }}<br>
                            {{ $debt->due_date }}<br>
                            {{ $debt->description }}
                        </div>
                        <div class="row__column row__column--middle row row--right">
                            <div class="row__column row__column--compact">

                                <a class="btn btn-sm btn-success" href="{{ route('debts.edit', $debt->id) }}"><i
                                        class="fa fa-fw fa-edit"></i></a>
                            </div>
                            <div class="row__column row__column--compact ml-2">
                                @if (false)
                                    <i class="fas fa-trash-alt"></i>
                                @else
                                    <form method="POST" action="{{ route('debts.destroy', $debt->id) }}">
                                        {{ method_field('DELETE') }}
                                        {{ csrf_field() }}
                                        <button class="button link">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                @include('partials.empty_state', ['payload' => 'tags'])
            @endif
        </div>
    </div>
@endsection
