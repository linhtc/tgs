<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Cá nhân
        <small>Thay đổi mật khẩu</small>
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
                    <h3 class="box-title">Thay đổi mật khẩu</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body pad">
                    <div class="col-md-6">
                        <form action="{base_url()}admin/users/submit_change_password_admin" method="post" id="change-password">
                            <div class="form-group">
                                <label>Mật khẩu mới</label>
                                <input id="password-2" name="password-2" type="password" class="form-control" placeholder="...">
                            </div>

                            <div class="form-group">
                                <label>Nhập lại mật khẩu mới</label>
                                <input id="password-3" name="password-3" type="password" class="form-control" placeholder="...">
                            </div>
                        </form>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-success" onclick="submitChangePassword();">Cập nhật</button>
                    <button type="submit" class="btn btn-danger" onclick="cancelChangePassword();">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>

    <div class="example-modal">
        <div id="my-modal-alert" class="modal modal-primary">
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
<script>
    function showAlert(content) {
        $('#my-modal-alert').modal({
            backdrop: 'static',
            keyboard: false
        });

        $("#content-alert").html("<p>" + content + "</p>");
    }

    function submitChangePassword() {
        var password_2 = $("#password-2").val();
        var password_3 = $("#password-3").val();

        if (password_2.length <= 5) {
            showAlert("Mật khẩu ít nhất 6 ký tự");
            return;
        }

        if (password_3.length <= 5) {
            showAlert("Xác nhận mật khẩu ít nhất 6 ký tự");
            return;
        }

        if (password_2 != password_3) {
            showAlert("Mật khẩu mới lần 1 và lần 2 nhập không trùng nhau");
            return;
        }

        var postData = $('#change-password').serializeArray();
        var formURL = $('#change-password').attr("action");
        $.post(formURL, postData, function (data) {
            $("#password-1").val("");
            $("#password-2").val("");
            $("#password-3").val("");

            if (data == 1) {
                showAlert("Chúc mừng bạn đã đổi mật khẩu thành công");
            }

            if (data == 3) {
                showAlert("Mật khẩu hiện tại bạn nhập không chính xác");
            }
        });
    }

    function cancelChangePassword() {
        $("#password-2").val("");
        $("#password-3").val("");
    }
</script>