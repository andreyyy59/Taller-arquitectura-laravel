@extends('layout')

@section('title', __('models.debts'))

@section('body')

    <div class="wrapper my-3">
        <div class="row mb-3">
            <div class="row__column row__column--middle">
                <h2>{{ __('models.debts') }}</h2>
            </div>
            <div class="row__column row__column--compact row__column--middle">
                <a href="{{ route('debt-details.create', $debt) }}" class="button">{{ __('actions.create') }}
                    {{ __('general.crear_registro_deuda') }}</a>
            </div>
        </div>
        <div class="row row--responsive">
            <div class="row__column mr-3" style="max-width: 300px;">
                <div class="box">
                    <div class="box__section">
                        <div class="card">
                            <div class="card-header"
                                style="display: flex; justify-content: space-between; align-items: center;">
                                <div class="float-left">
                                    <span class="card-title">Deuda</span>
                                </div>
                                <div class="float-right">
                                    <a class="btn btn-primary btn-sm" href="{{ route('debts.index') }}">
                                        Atras </a>
                                </div>
                            </div>
                            <br>
                            <div class="card-body bg-white">

                                <div class="form-group mb-2 mb20">
                                    <strong>Tipo:</strong>
                                    {{ $debt->getTypeName() }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Cantidad:</strong>
                                    {{ $debt->amount }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Descripción:</strong>
                                    {{ $debt->description }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Quien:</strong>
                                    {{ $debt->Who }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Fecha limite:</strong>
                                    {{ $debt->due_date }}
                                </div>
                                <div class="form-group mb-2 mb20">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row__column">

                @foreach ($debt->debtDetails as $debtDetail)
                    <div class="box">
                        <div class="box__section row row--responsive">
                            <div class="row__column row__column--middle row row--middle">
                                <div v-pre>{{ $debtDetail->description }}</div>


                                <form action="{{ route('debt-details.destroy', [$debt, $debtDetail->id]) }}"
                                    method="POST">
                                    {{ method_field('DELETE') }}
                                    {{ csrf_field() }}
                                    <button class="button link">
                                        <i class="fas fa-trash fa-xs c-light ml-1"></i>
                                    </button>
                                </form>
                            </div>
                            <div class="row__column">
                                {{-- @if ($transaction->tag)
                                    <div class="row">
                                        <div class="row__column row__column--compact row__column--middle mr-05"
                                            style="font-size: 12px;">
                                            <i class="fas fa-tag" style="color: #{{ $transaction->tag->color }};"></i>
                                        </div>
                                        <div class="row__column row__column--compact row__column--middle" v-pre>
                                            {{ $transaction->tag->name }}</div>
                                    </div>
                                @endif --}}
                            </div>
                            <div class="row__column">
                                <div class="row">
                                    <div class="row__column row__column--compact row__column--middle mr-05"
                                        style="font-size: 12px;">
                                        <i class="fas fa-calendar"></i>
                                    </div>
                                    <div class="row__column row__column--compact row__column--middle" v-pre>
                                        {{ $debtDetail->date }}</div>
                                </div>
                            </div>
                            <div class="row__column row__column--compact w-20">
                                {{--  @if ($transaction->recurring_id)
                                    <i class="fas fa-recycle"></i>
                                @endif --}}
                            </div>
                            <div
                                class="row__column row__column--compact row__column--middle w-150 row row--middle row--right {{ $debtDetail->debt->type ? 'color-green' : 'color-red' }}">
                                <div class="row__column row__column--compact">{!! $currency !!}
                                    {{ $debtDetail->amount }}</div>
                                <div class="row__column row__column--compact ml-1">
                                    @switch($debtDetail->debt->type)
                                        @case(\App\Enums\TypeDebts::I_LEND->getId())
                                            <i class="fas fa-arrow-alt-left fa-sm"></i>
                                        @break

                                        @case(\App\Enums\TypeDebts::LEND_ME->getId())
                                            <i class="fas fa-arrow-alt-right fa-sm"></i>
                                        @break

                                        @default
                                    @endswitch

                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>
        </div>
    </div>




@endsection
