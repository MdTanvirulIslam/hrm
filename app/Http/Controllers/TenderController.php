<?php

namespace App\Http\Controllers;

use App\Models\Tender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TenderController extends Controller
{
    public function index(Request $request)
    {
        $query = Tender::where('created_by', Auth::id())
            ->orderBy('submission_date', 'asc');

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('tender_name', 'like', '%' . $request->search . '%')
                  ->orWhere('reference_number', 'like', '%' . $request->search . '%');
            });
        }

        $tenders = $query->get();

        return view('tender.index', compact('tenders'));
    }

    public function create()
    {
        return view('tender.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tender_name'     => 'required|string|max:255',
            'reference_number'=> 'nullable|string|max:100',
            'description'     => 'nullable|string|max:2000',
            'submission_date' => 'required|date|after_or_equal:today',
            'opening_date'    => 'nullable|date|after_or_equal:submission_date',
            'estimated_value' => 'nullable|numeric|min:0',
            'status'          => 'required|in:draft,submitted,awarded,rejected,cancelled',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        Tender::create([
            'tender_name'      => $request->tender_name,
            'reference_number' => $request->reference_number,
            'description'      => $request->description,
            'submission_date'  => $request->submission_date,
            'opening_date'     => $request->opening_date,
            'estimated_value'  => $request->estimated_value,
            'status'           => $request->status,
            'reminder_sent'    => false,
            'created_by'       => Auth::id(),
        ]);

        return redirect()->route('tender.index')
            ->with('success', 'Tender created successfully. A reminder email will be sent 3 days before the submission date.');
    }

    public function show($id)
    {
        $tender = Tender::where('created_by', Auth::id())->findOrFail($id);

        return view('tender.show', compact('tender'));
    }

    public function edit($id)
    {
        $tender = Tender::where('created_by', Auth::id())->findOrFail($id);

        return view('tender.edit', compact('tender'));
    }

    public function update(Request $request, $id)
    {
        $tender = Tender::where('created_by', Auth::id())->findOrFail($id);

        $validator = Validator::make($request->all(), [
            'tender_name'     => 'required|string|max:255',
            'reference_number'=> 'nullable|string|max:100',
            'description'     => 'nullable|string|max:2000',
            'submission_date' => 'required|date',
            'opening_date'    => 'nullable|date|after_or_equal:submission_date',
            'estimated_value' => 'nullable|numeric|min:0',
            'status'          => 'required|in:draft,submitted,awarded,rejected,cancelled',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // If submission_date changed, reset reminder so it fires again
        $resetReminder = $tender->submission_date != $request->submission_date;

        $tender->update([
            'tender_name'      => $request->tender_name,
            'reference_number' => $request->reference_number,
            'description'      => $request->description,
            'submission_date'  => $request->submission_date,
            'opening_date'     => $request->opening_date,
            'estimated_value'  => $request->estimated_value,
            'status'           => $request->status,
            'reminder_sent'    => $resetReminder ? false : $tender->reminder_sent,
        ]);

        return redirect()->route('tender.index')
            ->with('success', 'Tender updated successfully.');
    }

    public function destroy($id)
    {
        $tender = Tender::where('created_by', Auth::id())->findOrFail($id);
        $tender->delete();

        return redirect()->route('tender.index')
            ->with('success', 'Tender deleted successfully.');
    }
}
