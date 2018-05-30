<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Cá nhân
        <small>Thay đổi ảnh đại diện</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 500CMS</a></li>
        <li class="active">Cá nhân</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">

            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Thay đổi ảnh đại diện</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body pad">
                    <div class="col-md-4">
                        <form action="{base_url()}admin/users/submit_change_avatar" method="post" id="create-blogs">
                            <div class="form-group">
                                <label for="exampleInputFile">Hình đại diện</label>
                                <input type="hidden" id="article-thumbnail" name="article_thumbnail" value="{$user.avatar}">

                                <span class="mailbox-attachment-icon has-img">
                                    <img src="{if {$user.avatar} eq ""}http://placehold.it/760x426{else}{base_url()}media/images/{$user.avatar}{/if}" id="article-thumbnail-review" name="article-thumbnail-review" alt="">
                                </span>
                                <div class="mailbox-attachment-info">
                                    <div id="btnAvatarUpload" class="btn btn-block btn-warning btn-sm" style="width: 120px;">Chọn hình</div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-success" onclick="createNewBlog();">Cập nhật</button>
                    <button type="submit" class="btn btn-danger" onclick="cancel();">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>

    <div class="example-modal">
        <div id="my-modal-alert" class="modal modal-danger">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Thông báo!</h4>
                    </div>
                    <div class="modal-body">
                        <div id="content-alert"></div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Ok!</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<script src="{base_url()}static/default/template/main/js/ajaxupload.js"></script>

<script>
    function showAlert(content) {
        $('#my-modal-alert').modal({
            backdrop: 'static',
            keyboard: false
        });

        $("#content-alert").html("<p>" + content + "</p>");
    }

    function createNewBlog() {
        var postData = $('#basic-info-create-blogs, #create-blogs').serializeArray();
        var formURL = $('#create-blogs').attr("action");

        console.log(postData);
        $.post(formURL, postData, function (data) {
            console.log(data);

            if (data == 1) {
                var url = '{base_url()}admin/users/change_avatar';
                window.location.href = url;
            }
        });

    }

    function cancel() {
        var url = '{base_url()}admin/users/change_avatar';
        window.location.href = url;
    }

    $(document).ready(function () {
        console.log("Ready upload photo!");
        
        var button = $('#btnAvatarUpload'), interval;
        var url_upload = '{base_url()}admin/photos/upload_cover_article';
        var uri_image = '{base_url()}media/images/';
        var input_name = 'article_thumbnail';
        
        new AjaxUpload(button, {
            action: url_upload,
            name: 'file_name_avatar',
            onSubmit: function (file, ext) {        
                button.text('Đang tải lên...');
                this.disable();
                interval = window.setInterval(function () {
                    var text = button.text();
                    if (text.length < 13) {
                        button.text(text + '.');
                    } else {
                        button.text('Đang tải lên...');
                    }
                }, 200);
            },
            onComplete: function (file, response) {
                button.text('Hoàn tất');
                window.clearInterval(interval);
                this.enable();

                if ((response.substr(0, 11)) == '##SUCCESS##') {
                    var file_name = response.substr(11, response.length);
                    console.log(file_name);
                    $('#article-thumbnail-review').attr('src', uri_image + file_name);
                    $('input[name=' + input_name + ']').val(file_name);
                } else {
                    console.log(response);
                    showAlert("Không thể tải hình mà bạn đã chọn lên hệ thống. Vui lòng chọn lại hình khác!");
                }
            }
        });
    });
</script> 