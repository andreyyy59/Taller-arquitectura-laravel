<?php

namespace App\Http\Controllers;

use App\Enums\TypeDebts;
use App\Http\Requests\DebtDetailRequest;
use App\Models\Debt;
use App\Http\Requests\DebtRequest;
use App\Models\DebtDetail;
use App\Repositories\DebtRepository;
use Illuminate\Http\Request;

/**
 * Class DebtController
 * @package App\Http\Controllers
 */
class DebtController extends Controller
{

    private $debtRepository;

    public function __construct(DebtRepository $debtRepository)
    {
        $this->debtRepository = $debtRepository;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $debts = Debt::query()
            ->where('space_id', session('space_id'))
            ->latest()
            ->paginate();

        return view('debt.index', compact('debts'))
            ->with('i', (request()->input('page', 1) - 1) * $debts->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $debt = new Debt();
        $typeDebts = TypeDebts::getAll();

        return view('debt.create', compact('debt', 'typeDebts'));
    }
    public function createDetail(Debt $debt)
    {
        $this->authorize('update', $debt);
        $debtDetail = new DebtDetail();
        return view('debt-detail.create', compact('debtDetail', 'debt'));
    }

    public function destroyDetail(Debt $debt, DebtDetail $debtDetail)
    {
        $this->authorize('delete', $debt);
        $debtDetail->delete();

        return redirect()->route('debts.index')
            ->with('success', 'DebtDetail deleted successfully');
    }



    /**
     * Store a newly created resource in storage.
     */
    public function store(DebtRequest $request)
    {
        $request->validated();

        $this->debtRepository->create(session('space_id'), $request->all());

        return redirect()->route('debts.index')
            ->with('success', 'Debt created successfully.');
    }

    public function storeDetail(Debt $debt, Request $request)
    {
        // Autoriza la operación
        $this->authorize('update', $debt);

        // Agrega el campo `debt_id` a la solicitud
        $request->merge(['debt_id' => $debt->id]);

        // Valida la solicitud
        $validated = $request->validate((new DebtDetailRequest)->rules());

        // Crea el detalle de la deuda
        DebtDetail::create($validated);

        // Redirige con un mensaje de éxito
        return redirect()->route('debts.show', $debt)
            ->with('success', 'DebtDetail created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $debt = Debt::find($id);
        $this->authorize('view', $debt);
        return view('debt.show', compact('debt'));
    }

    /**
     * Display the specified resource.
     */

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {

        $debt = Debt::find($id);

        $this->authorize('edit', $debt);

        $typeDebts = TypeDebts::getAll();
        return view('debt.edit', compact('debt', 'typeDebts'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DebtRequest $request, Debt $debt)
    {
        $this->authorize('update', $debt);

        $debt->update($request->validated());

        return redirect()->route('debts.index')
            ->with('success', 'Debt updated successfully');
    }

    public function destroy($id)
    {
        $debt = Debt::find($id);
        $this->authorize('destroy', $debt);
        $debt->delete();

        return redirect()->route('debts.index')
            ->with('success', 'Debt deleted successfully');
    }
}
