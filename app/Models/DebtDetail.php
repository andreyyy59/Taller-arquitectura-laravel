<?php

namespace App\Models;

use App\Enums\TypeDebts;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DebtDetail
 *
 * @property $id
 * @property $debt_id
 * @property $amount
 * @property $description
 * @property $date
 * @property $created_at
 * @property $updated_at
 *
 * @property Debt $debt
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class DebtDetail extends Model
{


    protected $perPage = 20;

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['debt_id', 'amount', 'description', 'date'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function debt()
    {
        return $this->belongsTo(Debt::class);
    }

    public function getColorAmountDetail(): String
    {
        switch ($this->debt->type) {
            case TypeDebts::I_LEND->getId():
                return "#00FF00";
                break;
            case TypeDebts::LEND_ME->getId():
                return "#FF0000";
                break;
            default:
                return null;
                break;
        }
    }



}
