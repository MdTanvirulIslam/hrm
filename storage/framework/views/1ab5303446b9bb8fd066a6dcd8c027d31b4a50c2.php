
<?php echo e(Form::open(['route' => ['upload.bg.ph'], 'method' => 'post', 'enctype' => 'multipart/form-data', 'class'=>'uploadModal', 'id' => 'uploadForm'])); ?>

<div class="modal-body">
    <div class="row">
        <div class="col-md-12 mb-6">
            <label for="file" class="form-label">Download sample BG/PG CSV file</label>
            <a href="<?php echo e(asset(Storage::url('uploads/sample')) . '/sample-employee.csv'); ?>"
               class="btn btn-sm btn-primary rounded">
                <i class="ti ti-download"></i> <?php echo e(__('Download')); ?>

            </a>
        </div>
        <div class="choose-files mt-3">
            <label for="file">
                <div class="bg-primary"> <i class="ti ti-upload px-1"></i><?php echo e(__('Select CSV File')); ?></div>
                <input type="file" class="form-control file" name="file" id="file" data-filename="file">
            </label>
        </div>
        <div class="progress mt-3" style="display: none;">
            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
        </div>
        <div class="modal-footer">
            <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
            <input type="submit" value="<?php echo e(__('Upload')); ?>" class="btn btn-primary">
        </div>
    </div>
</div>
<?php echo e(Form::close()); ?>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        $('#uploadForm').on('submit', function(e) {
            e.preventDefault();

            var formData = new FormData(this);
            var progressBar = $('.progress-bar');
            var progressContainer = $('.progress');

            $.ajax({
                xhr: function() {
                    var xhr = new window.XMLHttpRequest();
                    xhr.upload.addEventListener("progress", function(evt) {
                        if (evt.lengthComputable) {
                            var percentComplete = (evt.loaded / evt.total) * 100;
                            progressBar.width(percentComplete + '%');
                            progressBar.text(percentComplete.toFixed(2) + '%');
                        }
                    }, false);
                    return xhr;
                },
                url: $(this).attr('action'),
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function() {
                    progressContainer.show();
                    progressBar.width('0%');
                    progressBar.text('0%');
                },
                success: function(response) {
                    progressBar.width('100%');
                    progressBar.text('100%');
                    setTimeout(function() {
                        alert(response.message); // Show success message
                        progressContainer.hide();
                        location.reload();
                    }, 1000);
                },
                error: function(xhr) {
                    progressContainer.hide();
                    alert('Error uploading file: ' + xhr.responseText);
                }
            });
        });

        function reloadTable() {
            $.ajax({
                url: '<?php echo e(route("bgpg.index")); ?>', // Use the table route name
                type: 'GET',
                success: function(response) {
                    // Replace the table content with the new data
                    $('#pc-dt-simple').html($(response).find('#pc-dt-simple').html());
                },
                error: function(xhr) {
                    alert('Error reloading table: ' + xhr.responseText);
                }
            });
        }
    });
</script>
<?php /**PATH E:\server\htdocs\hrm_two\resources\views/bgpg/import.blade.php ENDPATH**/ ?>