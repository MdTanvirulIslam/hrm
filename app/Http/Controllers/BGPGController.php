<?php

namespace App\Http\Controllers;

use App\Models\BgPgModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class BGPGController extends Controller
{
    public function index(Request $request)
    {
        if (\Auth::user()->can('Manage BG/PO/PG')) {
            if ($request->ajax()) {
                $query = BgPgModel::select(['id', 'client_name', 'address', 'tender_name', 'tender_reference_no', 'tender_id', 'tender_published_date', 'bg_pg_type', 'bank_name', 'bg_pg_no', 'bg_pg_date', 'bg_pg_amount', 'bg_pg_expire_date', 'status']);

                return DataTables::of($query)
                    ->addIndexColumn()
                    ->addColumn('action', function ($row) {
                        $btn = '';
                        if (\Gate::allows('Edit BG/PO/PG')) {
                            $btn .= '<a href="' . route('edit.bg.pg', $row->id) . '" class="btn btn-sm btn-info" data-bs-toggle="tooltip" title="Edit"><i class="ti ti-pencil"></i></a>';
                        }
                        if (\Gate::allows('Delete BG/PO/PG')) {
                            $btn .= '
                                <div class="action-btn bg-danger ms-2">
                                    <a href="#" class="mx-3 btn btn-sm align-items-center bs-pass-para delete-btn"
                                       data-bs-toggle="tooltip" title="Delete"
                                       data-id="' . $row->id . '">
                                        <i class="ti ti-trash text-white"></i>
                                    </a>
                                    ' . \Form::open(['method' => 'DELETE', 'route' => ['delete.bg.pg', $row->id], 'id' => 'delete-form-' . $row->id]) . \Form::close() . '
                                </div>';
                        }
                        return $btn;
                    })
                    ->editColumn('status', function ($row) {
                        return $row->status == 1 ? 'Pending' : 'Release';
                    })
                    ->rawColumns(['action'])
                    ->make(true);
            }
            return view('bgpg.index');
        } else {
            return redirect()->back()->with('error', 'Permission Denied');
        }

    }





    public function create(){
        $data = 0;
        return view('bgpg.create',compact('data'));
    }

    public function store(Request $request){

        $validator = \Validator::make(
            $request->all(), [
                'client_name' => 'required|string|max:255',
                'address' => 'required|string|max:255',
                'tender_name' => 'required|string|max:255',
                'tender_reference_no' => 'nullable|string|max:255|unique:bg_pg_models,tender_reference_no',
                'tender_id' => 'nullable|string|max:100',
                'tender_published_date' => 'required|date',
                'bg_pg_type' => 'required|string|max:55',
                'bank_name' => 'required|string|max:255',
                'bg_pg_no' => 'required|string|max:100',
                'bg_pg_date' => 'required|date',
                'bg_pg_amount' => 'required|numeric|min:0',
                'bg_pg_expire_date' => 'required|date',
                'status' => 'required|integer',
            ]
        );
        if($validator->fails())
        {
            $messages = $validator->getMessageBag();

            return redirect()->back()->withInput()->with('error', $messages->first());
        }

        BgPgModel::create($request->all());

        return redirect()->route('bgpg.index')->with('success', __('BG/PG  successfully created.'));
    }


    public function edit($id){

        if(\Auth::user()->can('Edit BG/PO/PG')) {
        $data = BgPgModel::where('id',$id)->first();
        return view('bgpg.edit',compact('data'));

        }else{
            return redirect()->back()->with('error','Permission denied');
        }
    }


    public function update(Request $request, $id){
        //dd($request->all());
        if(\Auth::user()->can('Edit Employee')) {
            $validator = \Validator::make(
                $request->all(), [
                    'client_name' => 'required|string|max:255',
                    'address' => 'required|string|max:255',
                    'tender_name' => 'required|string|max:255',
                    'tender_reference_no' => 'nullable|string|max:255',
                    'tender_id' => 'nullable|string|max:100',
                    'tender_published_date' => 'required|date',
                    'bg_pg_type' => 'required|string|max:55',
                    'bank_name' => 'required|string|max:255',
                    'bg_pg_no' => 'required|string|max:100',
                    'bg_pg_date' => 'required|date',
                    'bg_pg_amount' => 'required|numeric|min:0',
                    'bg_pg_expire_date' => 'required|date',
                    'status' => 'required|integer',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();

                return redirect()->back()->with('error', $messages->first());
            }

            $bgPgModel = BgPgModel::findOrFail($id);
            $bgPgModel->update($request->all());
            return redirect()->route('bgpg.index')->with('success', __('BG/PG  successfully updated.'));

        }else{
            return redirect()->back()->with('error','Permission denied');
        }
    }

    public function destroy($id){

        if(\Auth::user()->can('Delete BG/PO/PG')){
            $bgPgModel = BgPgModel::findOrFail($id);
            $bgPgModel->delete();
            return redirect()->back()->with('success','BG/PG Delete Successfully');
        }else{
            return redirect()->back()->with('error','Permission denied');
        }
    }

    public function importFile()
    {
        return view('bgpg.import');
    }

    /*public function import(Request $request) {
        $rules = [
            'file' => 'required|mimes:csv,txt',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->errors()->first());
        }

        // Store the uploaded file in the 'storage/app/temp' directory
        $fileName = time() . '_' . $request->file('file')->getClientOriginalName();
        $filePath = $request->file('file')->storeAs('temp', $fileName);

        // Get the full absolute path
        $fullPath = storage_path('temp/' . $fileName);

        if (!file_exists($fullPath)) {
            return redirect()->back()->with('error', 'File not found: ' . $fullPath);
        }

        DB::beginTransaction();

        try {
            if (($handle = fopen($fullPath, 'r')) !== false) {
                fgetcsv($handle); // Skip header if needed

                $data = [];
                $batchSize = 1000;
                $bgPgNumbers = []; // Store unique `bg_pg_no` values

                while (($row = fgetcsv($handle)) !== false) {
                    if (count($row) < 13) continue;

                    $bgPgNo = trim($row[8] ?? null);

                    if (!empty($bgPgNo)) {
                        // Check for duplicate BG/PG number
                        if (isset($bgPgNumbers[$bgPgNo])) {
                            fclose($handle);
                            \Storage::delete('temp/' . $fileName);
                            DB::rollBack();
                            return redirect()->back()->with('error', 'Duplicate BG/PG No found: ' . $bgPgNo);
                        } else {
                            $bgPgNumbers[$bgPgNo] = true;
                        }
                    }

                    $rowData = [
                        'client_name' => $row[0] ?? null,
                        'address' => $row[1] ?? null,
                        'tender_name' => $row[2] ?? null,
                        'tender_reference_no' => $row[3] ?? null,
                        'tender_id' => $row[4] ?? null,
                        'tender_published_date' => $row[5] ?? null,
                        'bg_pg_type' => $row[6] ?? null,
                        'bank_name' => $row[7] ?? null,
                        'bg_pg_no' => $bgPgNo,
                        'bg_pg_date' => $row[9] ?? null,
                        'bg_pg_amount' => $row[10] ?? null,
                        'bg_pg_expire_date' => $row[11] ?? null,
                        'status' => $row[12] ?? null,
                    ];

                    $rowValidator = \Validator::make($rowData, [
                        'client_name' => 'required|string|max:255',
                        'address' => 'required|string|max:255',
                        'tender_name' => 'required|string|max:255',
                        'tender_reference_no' => 'nullable|string|max:255',
                        'tender_id' => 'nullable|string|max:100',
                        'tender_published_date' => 'required|date',
                        'bg_pg_type' => 'required|string|max:55',
                        'bank_name' => 'required|string|max:255',
                        'bg_pg_no' => 'required|string|max:100',
                        'bg_pg_date' => 'required|date',
                        'bg_pg_amount' => 'required|numeric|min:0',
                        'bg_pg_expire_date' => 'required|date',
                        'status' => 'required|integer',
                    ]);

                    if ($rowValidator->fails()) {
                        fclose($handle);
                        \Storage::delete('temp/' . $fileName);
                        DB::rollBack();
                        return redirect()->back()->with('error', 'Invalid data in CSV: ' . implode(", ", $rowValidator->errors()->all()));
                    }

                    $data[] = $rowData;

                    if (count($data) >= $batchSize) {
                        DB::table('bg_pg_models')->insert($data);
                        $data = [];
                    }
                }

                fclose($handle);

                if (!empty($data)) {
                    DB::table('bg_pg_models')->insert($data);
                }
            }

            \Storage::delete('temp/' . $fileName);
            DB::commit();

            return redirect()->back()->with('success', 'BG/PG Uploaded Successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            \Storage::delete('temp/' . $fileName);
            return redirect()->back()->with('error', 'Error uploading file: ' . $e->getMessage());
        }
    }*/

    public function reloadTable() {
        $all_bg_pg = DB::table('bg_pg_models')->get(); // Fetch the latest data
        return view('bgpg.index', compact('all_bg_pg')); // Return the table partial view
    }

    public function import(Request $request) {
        $rules = [
            'file' => 'required|mimes:csv,txt',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }

        // Store the uploaded file in the 'storage/app/temp' directory
        $fileName = time() . '_' . $request->file('file')->getClientOriginalName();
        $filePath = $request->file('file')->storeAs('temp', $fileName);

        // Get the full absolute path
        $fullPath = storage_path('temp/' . $fileName);

        if (!file_exists($fullPath)) {
            return response()->json(['message' => 'File not found: ' . $fullPath], 404);
        }

        DB::beginTransaction();

        try {
            if (($handle = fopen($fullPath, 'r')) !== false) {
                fgetcsv($handle); // Skip header if needed

                $data = [];
                $batchSize = 1000;
                $bgPgNumbers = []; // Store unique `bg_pg_no` values

                while (($row = fgetcsv($handle)) !== false) {
                    if (count($row) < 13) continue;

                    $bgPgNo = trim($row[8] ?? null);

                    if (!empty($bgPgNo)) {
                        // Check for duplicate BG/PG number
                        if (isset($bgPgNumbers[$bgPgNo])) {
                            fclose($handle);
                            \Storage::delete('temp/' . $fileName);
                            DB::rollBack();
                            return response()->json(['message' => 'Duplicate BG/PG No found: ' . $bgPgNo], 400);
                        } else {
                            $bgPgNumbers[$bgPgNo] = true;
                        }
                    }

                    $rowData = [
                        'client_name' => $row[0] ?? null,
                        'address' => $row[1] ?? null,
                        'tender_name' => $row[2] ?? null,
                        'tender_reference_no' => $row[3] ?? null,
                        'tender_id' => $row[4] ?? null,
                        'tender_published_date' => $row[5] ?? null,
                        'bg_pg_type' => $row[6] ?? null,
                        'bank_name' => $row[7] ?? null,
                        'bg_pg_no' => $bgPgNo,
                        'bg_pg_date' => $row[9] ?? null,
                        'bg_pg_amount' => $row[10] ?? null,
                        'bg_pg_expire_date' => $row[11] ?? null,
                        'status' => $row[12] ?? null,
                    ];

                    $rowValidator = \Validator::make($rowData, [
                        'client_name' => 'required|string|max:255',
                        'address' => 'required|string|max:255',
                        'tender_name' => 'required|string|max:255',
                        'tender_reference_no' => 'nullable|string|max:255',
                        'tender_id' => 'nullable|string|max:100',
                        'tender_published_date' => 'required|date',
                        'bg_pg_type' => 'required|string|max:55',
                        'bank_name' => 'required|string|max:255',
                        'bg_pg_no' => 'required|string|max:100',
                        'bg_pg_date' => 'required|date',
                        'bg_pg_amount' => 'required|numeric|min:0',
                        'bg_pg_expire_date' => 'required|date',
                        'status' => 'required|integer',
                    ]);

                    if ($rowValidator->fails()) {
                        fclose($handle);
                        \Storage::delete('temp/' . $fileName);
                        DB::rollBack();
                        return response()->json(['message' => 'Invalid data in CSV: ' . implode(", ", $rowValidator->errors()->all())], 400);
                    }

                    $data[] = $rowData;

                    if (count($data) >= $batchSize) {
                        DB::table('bg_pg_models')->insert($data);
                        $data = [];
                    }
                }

                fclose($handle);

                if (!empty($data)) {
                    DB::table('bg_pg_models')->insert($data);
                }
            }

            \Storage::delete('temp/' . $fileName);
            DB::commit();

            return response()->json(['message' => 'BG/PG Uploaded Successfully'], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            \Storage::delete('temp/' . $fileName);
            return response()->json(['message' => 'Error uploading file: ' . $e->getMessage()], 500);
        }
    }

    public function deleteMultiple(Request $request)
    {
        $ids = $request->input('ids'); // Get the selected row IDs

        if (empty($ids)) {
            return response()->json(['message' => 'No rows selected for deletion.'], 400);
        }

        // Delete the selected rows
        DB::table('bg_pg_models')->whereIn('id', $ids)->delete();

        return response()->json(['message' => 'Selected rows deleted successfully.'], 200);
    }

}



