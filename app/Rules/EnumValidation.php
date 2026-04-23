<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class EnumValidation implements ValidationRule
{

    private string $enumClass;
    public function __construct(string $enumClass)
    {
        $this->enumClass = $enumClass;
    }

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (!in_array($value, $this->enumClass::getIds())) {
            $fail("The selected {$attribute} is invalid.");
        }
    }
}
