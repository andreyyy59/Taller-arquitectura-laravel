

<div class="input input--small">
    <label>{{ __('fields.amount') }}</label>
    <input type="text" name="amount" class="form-control @error('amount') is-invalid @enderror" value="{{ old('amount', $debtDetail?->amount) }}" id="amount" placeholder="Amount">
    @include('partials.validation_error', ['payload' => 'amount'])
</div>

<div class="input input--small">
    <label>{{ __('fields.description') }}</label>
    <input type="text" name="description" class="form-control @error('description') is-invalid @enderror"
        value="{{ old('description', $debtDetail?->description) }}" id="description" placeholder="Description">
    @include('partials.validation_error', ['payload' => 'description'])
</div>
<div class="input input--small">
    <label>{{ __('fields.date') }}</label>
    <input type="date" name="date"
        style="
        display: block;
        width: 100%;
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #ffffff;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    "
        class="form-control @error('date') is-invalid @enderror"
        value="{{ old('date', $debtDetail?->date) }}" id="date" placeholder="date">
    @include('partials.validation_error', ['payload' => 'date'])
</div>
