<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Tài khoản
        <small>Sửa tài khoản</small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Thông tin cơ bản</h3>
                </div>
                <form action="{base_url()}admin/users/submit_edit" method="post" id="basic-info-create-blogs">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Tài khoản</label>
                            <input readonly type="text" id="username" name="username" class="form-control" value="{$user.username}">
                        </div>
                        <div class="form-group">
                            <label>Họ và tên</label>
                            <input type="text" id="full_name" name="full_name" class="form-control" value="{$user.full_name}">
                        </div>
						<div class="form-group">
							<label>Nhóm</label>
							<select name="group_id" id="group_id" class="form-control">
								{foreach from=$groups key=i item=igroup}
									<option {if $igroup.id eq $user.group_id}selected{/if} value="{$igroup.id}">{$igroup.group_name}</option>
								{/foreach}
							</select>
						</div>
						<div class="form-group">
							<label>Quyền quản trị</label>
							<select class="form-control" id="is_administrator" name="is_administrator">
								<option value="0" {if $user.is_administrator == 0}selected{/if}>Không</option>
								<option value="1" {if $user.is_administrator == 1}selected{/if}>Có</option>
							</select>
						</div>
                    </div>
                    <input type="hidden" name="id" id="id" value="{$user.id}">
                </form>
                <div class="box-footer">
                    <button type="submit" class="btn btn-success" onclick="editUser();">Cập nhật</button>
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

<script>
    function showAlert(content) {
        $('#my-modal-alert').modal({
            backdrop: 'static',
            keyboard: false
        });

        $("#content-alert").html("<p>" + content + "</p>");
    }
    function editUser() {
        var full_name = $("#full_name").val();
        var is_administrator = $("#is_administrator").val();

        if (full_name.trim() == '') {
            showAlert("Bạn cần nhập Họ và tên!");
            return;
        }

        var postData = $('#basic-info-create-blogs').serializeArray();
        var formURL = $('#basic-info-create-blogs').attr("action");

        console.log(postData);
        $.post(formURL, postData, function (data) {
            console.log(data);

            if (data > 0) {
                var url = '{base_url()}admin/users/view';
                window.location.href = url;
            }
        });

    }

    function cancel() {
        var url = '{base_url()}admin/users/view';
        window.location.href = url;
    }
</script>