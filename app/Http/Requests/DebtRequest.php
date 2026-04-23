<?php

namespace App\Http\Requests;

use App\Enums\TypeDebts;
use App\Rules\EnumValidation;
use Illuminate\Foundation\Http\FormRequest;

class DebtRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'type' => ['required', new EnumValidation(TypeDebts::class)],
			'amount' => 'required|numeric',
			'description' => 'required|string',
			'Who' => 'required|string',
            'due_date'=>'required|date'
        ];
    }
}
