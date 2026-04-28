<?php

namespace App\Repositories;

use App\Models\Budget;
use App\Models\Spending;
use Exception;
use Illuminate\Support\Facades\DB;

class BudgetRepository
{
    public function getValidationRules()
    {
        return [
            'tag_id' => 'required|exists:tags,id',
            'period' => 'required|in:' . implode(',', $this->getSupportedPeriods()),
            'amount' => 'required|regex:/^\d*(\.\d{2})?$/'
        ];
    }

    public function getSupportedPeriods(): array
    {
        return [
            'yearly',
            'monthly',
            'weekly',
            'daily'
        ];
    }

    public function doesExist(int $spaceId, int $tagId): bool
    {
        return Budget::where('space_id', $spaceId)
            ->where('tag_id', $tagId)
            ->where('starts_on', '<=', now())
            ->where(function ($query) {
                $query->where('ends_on', '>', now())
                    ->orWhereNull('ends_on');
            })
            ->exists();
    }

    public function getActive()
    {
        $today = date('Y-m-d');

        return Budget::where('space_id', session('space_id'))
            ->where('starts_on', '<=', $today)
            ->where(function ($query) use ($today) {
                $query->where('ends_on', '>=', $today)
                    ->orWhereNull('ends_on');
            })
            ->get();
    }

    public function getById(int $id): ?Budget
    {
        return Budget::find($id);
    }

    public function getSpentById(int $id): int
    {
        $budget = $this->getById($id);

        if (!$budget) {
            throw new Exception('Could not find budget (where ID is ' . $id . ')');
        }

        if ($budget->period === 'yearly') {
            return Spending::where('space_id', session('space_id'))
                ->where('tag_id', $budget->tag->id)
                ->whereYear('happened_on', date('Y'))
                ->sum('amount');
        }

        if ($budget->period === 'monthly') {
            return Spending::where('space_id', session('space_id'))
                ->where('tag_id', $budget->tag->id)
                ->whereYear('happened_on', date('Y'))
                ->whereMonth('happened_on', date('n'))
                ->sum('amount');
        }

        if ($budget->period === 'weekly') {
            return Spending::where('space_id', session('space_id'))
                ->where('tag_id', $budget->tag->id)
                ->whereBetween('happened_on', [
                    date('Y-m-d', strtotime('monday this week')),
                    date('Y-m-d', strtotime('sunday this week'))
                ])
                ->sum('amount');
        }

        if ($budget->period === 'daily') {
            return Spending::where('space_id', session('space_id'))
                ->where('tag_id', $budget->tag->id)
                ->whereDate('happened_on', date('Y-m-d'))
                ->sum('amount');
        }

        throw new Exception('No clue what to do with period "' . $budget->period . '"');
    }

    public function create(int $spaceId, int $tagId, string $period, int $amount): ?Budget
    {
        if ($this->doesExist($spaceId, $tagId)) {
            throw new Exception(vsprintf('Budget (with space ID being %s and tag ID being %s) already exists', [
                $spaceId,
                $tagId
            ]));
        }

        if (!in_array($period, $this->getSupportedPeriods())) {
            throw new Exception('Unknown period "' . $period . '"');
        }

        return Budget::create([
            'space_id' => $spaceId,
            'tag_id' => $tagId,
            'period' => $period,
            'amount' => $amount,
            'starts_on' => date('Y-m-d')
        ]);
    }
}
