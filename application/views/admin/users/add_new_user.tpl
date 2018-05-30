<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Tài khoản
        <small>Tạo mới tài khoản</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 500CMS</a></li>
        <li class="active">Tài khoản</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Tạo mới tài khoản</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body pad">
                    <div class="col-md-6">
                        <form action="{base_url()}admin/users/submit_add_new_user" method="post" id="change-password">
                            <div class="form-group">
                                <label>Tài khoản</label>
                                <input id="username" name="username" type="text" class="form-control" placeholder="...">
                            </div>

                            <div class="form-group">
                                <label>Họ và tên</label>
                                <input id="fullname" name="fullname" type="text" class="form-control" placeholder="...">
                            </div>

                            <div class="form-group">
                                <label>Mật khẩu (lần 1)</label>
                                <input id="password-1" name="password-1" type="password" class="form-control" placeholder="...">
                            </div>

                            <div class="form-group">
                                <label>Mật khẩu (lần 2)</label>
                                <input id="password-2" name="password-2" type="password" class="form-control" placeholder="...">
                            </div>

                            <div class="form-group">
                                <label>Nhóm</label>
                                <select name="group_id" id="group_id" class="form-control">
									<option value="">...</option>
									{foreach from=$groups key=i item=igroup}
										<option {if $igroup.id eq $i}selected{/if} value="{$igroup.id}">{$igroup.group_name}</option>
									{/foreach}
								</select>
                            </div>
							
                            <div class="form-group">
                                <label>Quyền quản trị</label>
                                <select class="form-control" id="is-administrator" name="is_administrator">
                                    <option value="0">Không</option>
                                    <option value="1">Có</option>
                                </select>
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
        var username = $("#username").val();
        var fullname = $("#fullname").val();
        var password_1 = $("#password-1").val();
        var password_2 = $("#password-2").val();
        var group_id = $("#group_id").val();

        if (username.length <= 5) {
            showAlert("Bạn cần nhập tên tài khoản");
            return;
        }

        if (fullname.length <= 5) {
            showAlert("Bạn cần nhập họ và tên");
            return;
        }
        if (group_id.trim() == '') {
            showAlert("Bạn cần chọn nhóm");
            return;
        }

        if (password_1.length <= 5) {
            showAlert("Bạn cần nhập mật khẩu (lần 1)");
            return;
        }

        if (password_2.length <= 5) {
            showAlert("Bạn cần nhập mật khẩu (lần 2)");
            return;
        }

        if (password_1 != password_2) {
            showAlert("Mật khẩu mới lần 1 và lần 2 nhập không trùng nhau");
            return;
        }

        var postData = $('#change-password').serializeArray();
        var formURL = $('#change-password').attr("action");
        $.post(formURL, postData, function (data) {
            console.log(data);
            if (data == 1) {
                showAlert("Tài khoản đã tồn tại");
                return;
            }

            if (data == 2) {
                var url = '{base_url()}admin/users/view';
                window.location.href = url;
            }
        });
    }

    function cancelChangePassword() {
        $("#password-1").val("");
        $("#password-2").val("");
        $("#password-3").val("");
        var url = '{base_url()}admin/users/view';
        window.location.href = url;
    }
</script>