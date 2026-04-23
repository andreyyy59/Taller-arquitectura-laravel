<?php

namespace App\Repositories;

use App\Models\Debt;
use Exception;
use Illuminate\Database\Eloquent\Collection;

interface DebtRepository
{
    public function create(int $spaceId, array $data): Debt;
    public function getDebtsDetailsById($debtId):Collection;
}
