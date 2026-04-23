<?php

namespace App\Repositories;

use App\Models\Space;

class SpaceRepository
{
    public function create(int $currencyId, string $name, string $color = "0000FF"): Space
    {
        return Space::create([
            'currency_id' => $currencyId,
            'color' => $color,
            'name' => $name
        ]);
    }
}
