<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class Space extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'currency_id',
        'name',
        'color'
    ];

    // Relations
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_space')->withPivot('role');
    }

    public function invites()
    {
        return $this->hasMany(SpaceInvite::class);
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }

    public function tags()
    {
        return $this->hasMany(Tag::class);
    }

    public function earnings()
    {
        return $this->hasMany(Earning::class);
    }

    public function spendings()
    {
        return $this->hasMany(Spending::class);
    }

    public function recurrings()
    {
        return $this->hasMany(Recurring::class);
    }

    public function imports()
    {
        return $this->hasMany(Import::class);
    }

    public function activities()
    {
        return $this->hasMany(Activity::class);
    }

    // Accessors
    protected function abbreviatedName(): Attribute
    {
        return Attribute::make(fn() => Str::limit($this->name, 3));
    }

    //
    public function monthlyBalance($year, $month)
    {
        $earningsAmount = Earning::where('space_id', $this->id)
            ->whereYear('happened_on', $year)
            ->whereMonth('happened_on', $month)
            ->sum('amount');

        $spendingsAmount = Spending::where('space_id', $this->id)
            ->whereYear('happened_on', $year)
            ->whereMonth('happened_on', $month)
            ->sum('amount');

        if (!$spendingsAmount) {
            return $earningsAmount;
        } else {
            return $earningsAmount - $spendingsAmount;
        }
    }

    public function generalBalance()
    {
        // Suma de todos los ingresos para este espacio
        $earningsAmount = Earning::where('space_id', $this->id)
            ->sum('amount');

        // Suma de todos los gastos para este espacio
        $spendingsAmount = Spending::where('space_id', $this->id)
            ->sum('amount');

        // Calcular el balance general
        if (!$spendingsAmount) {
            return $earningsAmount;
        } else {
            return $earningsAmount - $spendingsAmount;
        }
    }


    public function monthlyRecurrings($year, $month)
    {
        return $this->recurrings()
            ->whereYear('starts_on', '<=', $year)
            ->whereMonth('starts_on', '<=', $month)
            ->where(function ($query) use ($year, $month) {
                $query->where(function ($query) use ($year, $month) {
                    $query->whereYear('ends_on', '>=', $year)
                        ->whereMonth('ends_on', '>=', $month);
                })->orWhereNull('ends_on');
            })
            ->sum('amount');
    }
}
