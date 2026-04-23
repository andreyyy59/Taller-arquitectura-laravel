<?php

namespace App\Actions;

use App\Models\Space;

class CreateSpaceAction
{
    public function execute(string $name, int $currencyId, int $creatorUserId, string $color = null): Space
    {
        $space = Space::create([
            'name' => $name,
            'color' => $color,
            'currency_id' => $currencyId
        ]);

        $space->users()->attach($creatorUserId, ['role' => 'admin']);

        return $space;
    }

}
