<?php

namespace App\Repositories;

use App\Enums\TypeDebts;
use App\Models\Debt;
use Exception;
use Illuminate\Database\Eloquent\Collection;

class ORMDebtRepository implements DebtRepository
{
    public function create(int $spaceId, array $data): Debt
    {
        $data['space_id'] = $spaceId;
        return Debt::create($data);
    }
    public function getDebtsDetailsById($debtId): Collection
    {
        //aqui se deben retornar los detalles
        return Debt::all();
    }

}
