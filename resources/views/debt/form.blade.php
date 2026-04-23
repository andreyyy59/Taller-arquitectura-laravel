


    <div class="input input--small">
        <label>{{ __('fields.type') }}</label>
        <select name="type">
            @foreach ($typeDebts as $id => $name)
                <option value="{{ $id }}" v-pre @if ($debt?->type == $id)@selected(true)
                @endif>{{ $name }}</option>
            @endforeach
        </select>
        @include('partials.validation_error', ['payload' => 'type'])
    </div>

    <div class="input input--small">
        <label>{{ __('fields.amount') }}</label>
        <input type="text" name="amount" value="{{ old('amount', $debt?->amount) }}" />
        @include('partials.validation_error', ['payload' => 'amount'])
    </div>

    <div class="input input--small">
        <label>{{ __('fields.description') }}</label>
        <input type="text" name="description" class="form-control @error('description') is-invalid @enderror"
            value="{{ old('description', $debt?->description) }}" id="description" placeholder="Description">
        @include('partials.validation_error', ['payload' => 'description'])
    </div>

    <div class="input input--small">
        <label>{{ __('fields.who') }}</label>
        <input type="text" name="Who" class="form-control @error('Who') is-invalid @enderror"
            value="{{ old('Who', $debt?->Who) }}" id="who" placeholder="Who">
        @include('partials.validation_error', ['payload' => 'who'])
    </div>

    <div class="input input--small">
        <label>{{ __('fields.due_date') }}</label>
        <input type="date" name="due_date"
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
            class="form-control @error('due_date') is-invalid @enderror"
            value="{{ old('due_date', $debt?->due_date) }}" id="due_date" placeholder="due_date">
        @include('partials.validation_error', ['payload' => 'due_date'])
    </div>



