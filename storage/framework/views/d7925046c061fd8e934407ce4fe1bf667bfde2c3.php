<?php $__env->startSection('page-title'); ?>
   <?php echo e(__('Create BG/PG')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(url('employee')); ?>"><?php echo e(__('BG/PG')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Create BG/PG')); ?></li>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
    <div class="">
        <div class="">
            <div class="row">

            </div>
            <?php echo e(Form::open(['route' => ['update.bg.pg', $data->id], 'method' => 'post', 'enctype' => 'multipart/form-data'])); ?>

            <div class="row">
                <div class="col-md-12">
                    <div class="card em-card">
                        <div class="card-header">
                            <h5><?php echo e(__('BG/PG Detail')); ?></h5>
                        </div>
                        <div class="card-body employee-detail-create-body">
                            <div class="row">
                                <?php echo csrf_field(); ?>
                                <div class="form-group col-md-6">
                                    <label for="client_name" class="form-label">Client Name *</label>
                                    <input type="text" class="form-control" name="client_name" id="client_name" value="<?php echo e($data->client_name); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address" class="form-label">Address *</label>
                                    <input type="text" class="form-control" name="address" id="address" value="<?php echo e($data->address); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_name" class="form-label">Tender Name *</label>
                                    <input type="text" class="form-control" name="tender_name" id="tender_name" value="<?php echo e($data->tender_name); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_reference_no" class="form-label">Tender Reference No </label>
                                    <input type="text" class="form-control" name="tender_reference_no" id="tender_reference_no" value=" <?php echo e($data->tender_reference_no); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_id" class="form-label">Tender ID</label>
                                    <input type="text" class="form-control" name="tender_id" id="tender_id" value="<?php echo e($data->tender_id); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_published_date" class="form-label">Tender Published Date *</label>
                                    <input type="date" class="form-control" name="tender_published_date" id="tender_published_date" value="<?php echo e($data->tender_published_date); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_type" class="form-label">BG/PG Type *</label>
                                    <div class="form-icon-user">
                                        <select class="form-control" name="bg_pg_type" id="bg_pg_type">
                                            <option value="BG" <?php echo e(($data->bg_pg_type == 'BG') ? 'selected' : ''); ?>>BG</option>
                                            <option value="PO" <?php echo e(($data->bg_pg_type == 'PO') ? 'selected' : ''); ?>>PO</option>
                                            <option value="PG" <?php echo e(($data->bg_pg_type == 'PG') ? 'selected' : ''); ?>>PG</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="bank_name" class="form-label">Bank Name</label>
                                    <input type="text" class="form-control" name="bank_name" id="bank_name" value="<?php echo e($data->bank_name); ?>">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="bg_pg_no" class="form-label">BG/PG No</label>
                                    <input type="text" class="form-control" name="bg_pg_no" id="bg_pg_no" value="<?php echo e($data->bg_pg_no); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_date" class="form-label">BG/PG Date</label>
                                    <input type="date" class="form-control" name="bg_pg_date" id="bg_pg_date" value="<?php echo e($data->bg_pg_date); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_amount" class="form-label">BG/PG Amount</label>
                                    <input type="text" class="form-control" name="bg_pg_amount" id="bg_pg_amount" value="<?php echo e($data->bg_pg_amount); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_expire_date" class="form-label">BG/PG Expire Date</label>
                                    <input type="date" class="form-control" name="bg_pg_expire_date" id="bg_pg_expire_date" value="<?php echo e($data->bg_pg_expire_date); ?>">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="status" class="form-label">Select Status *</label>
                                    <div class="form-icon-user">
                                        <select class="form-control" name="status" id="status">
                                            <option value="1" <?php echo e(($data->status ==1)? 'selected' : ''); ?>>Pending</option>
                                            <option value="2" <?php echo e(($data->status ==2)? 'selected' : ''); ?>>Release</option>
                                        </select>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="float-end">
            <button type="submit"  class="btn  btn-primary"><?php echo e('Create'); ?></button>
        </div>
        </form>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
<script>
      $('input[type="file"]').change(function(e) {
        var file = e.target.files[0].name;
        var file_name=$(this).attr('data-filename');
        $('.'+file_name).append(file);
    });
</script>


<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\server\htdocs\hrm_two\resources\views/bgpg/edit.blade.php ENDPATH**/ ?>