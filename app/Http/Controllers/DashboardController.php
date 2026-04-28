<?php

namespace App\Http\Controllers;

use App\Repositories\TagRepository;
use Illuminate\Http\Request;
use App\Repositories\DashboardRepository;
use App\Models\Space;

class DashboardController extends Controller
{
    private $dashboardRepository;
    private $tagRepository;

    public function __construct(DashboardRepository $dashboardRepository, TagRepository $tagRepository)
    {
        $this->dashboardRepository = $dashboardRepository;
        $this->tagRepository = $tagRepository;
    }

    public function __invoke(Request $request)
    {
        $space_id = session('space_id');
        $currentYear = date('Y');
        $currentMonth = date('m');
        // Esta función me dice cuántos días hay en un mes específico.
        $daysInMonth = date('t', mktime(0, 0, 0, $currentMonth, 1, $currentYear));

        $mostExpensiveTags = $this->tagRepository->getMostExpensiveTags($space_id, null, $currentYear, $currentMonth);

        $space = Space::find($space_id);

        return view('dashboard', [
            'month' => date('n'),

            'widgets' => $request->user()->widgets()->orderBy('sorting_index')->get(),

            'totalSpent' => $this->dashboardRepository->getTotalAmountSpent($currentYear, $currentMonth),
            'mostExpensiveTags' => $mostExpensiveTags,

            'daysInMonth' => $daysInMonth,
            'dailyBalance' => $this->dashboardRepository->getDailyBalance(
                $space_id,
                $currentYear,
                $currentMonth,
            ),
            'currency' => $space->currency->symbol
        ]);
    }
}
