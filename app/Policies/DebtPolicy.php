<?php

namespace App\Policies;

use App\Models\Debt;
use App\Models\User;

class DebtPolicy
{
    public function view(User $user, Debt $debt)
    {
        return $user->spaces->contains($debt->space_id);
    }

    public function edit(User $user, Debt $debt)
    {
        return $user->spaces->contains($debt->space_id);
    }

    public function update(User $user, Debt $debt)
    {
        return $user->spaces->contains($debt->space_id);
    }

    public function delete(User $user, Debt $debt)
    {
        return $user->spaces->contains($debt->space_id);
    }
}
