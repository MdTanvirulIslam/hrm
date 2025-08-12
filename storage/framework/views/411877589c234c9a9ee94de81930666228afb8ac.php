<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage BG/PG')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('bgpg.index')); ?>"><?php echo e(__('BG/PG')); ?></a></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    

    <a href="#" data-url="<?php echo e(route('import.bg.ph')); ?>" data-ajax-popup="true"
       data-title="<?php echo e(__('Import  BG/PG CSV file')); ?>" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
       data-bs-original-title="<?php echo e(__('Import')); ?>">
        <i class="ti ti-file"></i>
    </a>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?>
        <a href="<?php echo e(route('bgpg.create')); ?>"
           data-title="<?php echo e(__('Create BG/PG')); ?>" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
           data-bs-original-title="<?php echo e(__('Create')); ?>">
            <i class="ti ti-plus"></i>
        </a>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                
                <div class="table-responsive">
                    

                    <table class="table" id="bgpg-table">
                        <thead>
                        <tr>
                            <th>SL</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Tender Name</th>
                            <th>Tender Reference No</th>
                            <th>Tender ID</th>
                            <th>Tender Published Date</th>
                            <th>Type</th>
                            <th>Bank Name</th>
                            <th>BG/PO/PG No</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Expire Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script>
        $(document).ready(function () {
            $('#bgpg-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "<?php echo e(route('bgpg.index')); ?>",
                columns: [
                    { data: 'id', name: 'id', searchable: false, orderable: false },
                    { data: 'client_name', name: 'client_name' },
                    { data: 'address', name: 'address' },
                    { data: 'tender_name', name: 'tender_name' },
                    { data: 'tender_reference_no', name: 'tender_reference_no' },
                    { data: 'tender_id', name: 'tender_id' },
                    { data: 'tender_published_date', name: 'tender_published_date' },
                    { data: 'bg_pg_type', name: 'bg_pg_type' },
                    { data: 'bank_name', name: 'bank_name' },
                    { data: 'bg_pg_no', name: 'bg_pg_no' },
                    { data: 'bg_pg_date', name: 'bg_pg_date' },
                    { data: 'bg_pg_amount', name: 'bg_pg_amount' },
                    { data: 'bg_pg_expire_date', name: 'bg_pg_expire_date' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action' }
                ],
                columnDefs: [
                    {
                        targets: 0,
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    }
                ]
            });

            $(document).on('click', '.delete-btn', function (e) {
                e.preventDefault();
                var id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This action can not be undone. Do you want to continue?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#6fd943',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#delete-form-' + id).submit(); // Submit the form
                    }
                })
            });
        });
    </script>
<?php $__env->stopPush(); ?>


<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\server\htdocs\hrm_two\resources\views/bgpg/index.blade.php ENDPATH**/ ?>