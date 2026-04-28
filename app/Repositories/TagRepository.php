<?php

namespace App\Repositories;

use App\Models\Tag;
use Exception;
use Illuminate\Support\Facades\DB;

class TagRepository
{
    public function getValidationRules(): array
    {
        return [
            'name' => 'required|max:255',
            'color' => 'required|max:6'
        ];
    }

    public function getById(int $id): ?Tag
    {
        return Tag::find($id);
    }

    public function getMostExpensiveTags(
        int $spaceId,
        int $limit = null,
        int $year = null,
        int $month = null,
        string $startDate = null,
        string $endDate = null
    ) {
        $query = DB::table('tags')
            ->select('tags.name', 'tags.color', DB::raw('SUM(spendings.amount) AS amount'))
            ->leftJoin('spendings', function ($join) {
                $join->on('tags.id', '=', 'spendings.tag_id')
                    ->whereNull('spendings.deleted_at');
            })
            ->where('tags.space_id', $spaceId);

        if ($year) {
            $query->whereYear('spendings.happened_on', $year);
        }

        if ($month) {
            $query->whereMonth('spendings.happened_on', $month);
        }

        if ($startDate && $endDate) {
            $query->whereBetween('spendings.happened_on', [$startDate, $endDate]);
        } elseif ($startDate) {
            $query->where('spendings.happened_on', '>=', $startDate);
        } elseif ($endDate) {
            $query->where('spendings.happened_on', '<=', $endDate);
        }

        $query->groupBy('tags.id', 'tags.name', 'tags.color')
            ->orderByDesc(DB::raw('SUM(spendings.amount)'));

        if ($limit) {
            $query->limit($limit);
        }

        return $query->get();
    }




    public function create(int $spaceId, string $name, string $color): Tag
    {
        // Check if color is HEX
        if (strlen($color) !== 6 || !ctype_xdigit($color)) {
            throw new Exception('Invalid color');
        }

        return Tag::create([
            'space_id' => $spaceId,
            'name' => $name,
            'color' => $color
        ]);
    }

    public function update(int $tagId, array $data): void
    {
        $tag = Tag::find($tagId);

        if (!$tag) {
            throw new Exception('Could not find tag with ID ' . $tagId);
        }

        $tag->fill($data)->save();
    }
}
