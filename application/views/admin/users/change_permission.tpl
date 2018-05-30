<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Người dùng
        <small>Phân quyền</small>
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
                    <h3 class="box-title">Ghi chú: Chọn các mục bên dưới để phân quyền</h3>
                </div>

                <div class="box-body table-responsive no-padding">
                    <div id="jstree">

                    </div>
                    <form action="{base_url()}admin/users/submit_change_permission" method="post" id="change-permission">
                        <input type="hidden" name="id" id="id" value="{$id}">
                        <input type="hidden" name="permissions" id="permissions" value="{$id}">
                    </form>
                </div>
				
				<div class="box-footer">
                    <button type="submit" class="btn btn-success" onclick="submitChange();">Cập nhật</button>
                    <button type="submit" class="btn btn-success" onclick="likeGroup();">Giống nhóm</button>
                    <button type="submit" class="btn btn-danger" onclick="cancelChange();">Hủy bỏ</button>
                </div>

                <div class="box-footer clearfix">
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

{*<script src="//cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>*}
<script src="{base_url()}static/admin/template/plugins/jstree/jstree.min.js"></script>
<script>
    var menuList = '{$menuList}';
    menuList = JSON.parse(menuList);
    $('#jstree').jstree({
        'core' : {
            'data' : menuList
        },
        "plugins" : [ "wholerow", "checkbox" ]
    });

    setTimeout(function(){ $('#jstree').jstree('close_all'); }, 500);

    function showAlert(content) {
        $('#my-modal-alert').modal({
            backdrop: 'static',
            keyboard: false
        }).on('hidden.bs.modal', function(event, modal) {
            window.location = '{base_url()}admin/users/view';
        });

        $("#content-alert").html("<p>" + content + "</p>");
    }

    function submitChange() {
        initLoading();
        var permissions = JSON.stringify($('#jstree').jstree().get_selected(true));
        $('#permissions').val(permissions);
        var postData = $('#change-permission').serializeArray();
        var formURL = $('#change-permission').attr("action");
        $.post(formURL, postData, function (data) {
            /*console.log(data);*/
            destroyLoading();
            if (data == 1) {
                /*showAlert("Cập nhật thành công");*/
                toastr.success('Cập nhật thành công', 'Thông báo');
                setTimeout(function(){ window.location = '{base_url()}admin/users/view'; }, 2000);
            } else{
                /*showAlert("Đã có lỗi xãy ra");*/
                toastr.warning('Đã có lỗi xãy ra', 'Thông báo');
            }
        });
    }
    function likeGroup() {
        initLoading();
        var permissions = JSON.stringify($('#jstree').jstree().get_selected(true));
        $('#permissions').val(permissions);
        var postData = $('#change-permission').serializeArray();
        postData.push({ name: 'like_group', value: 1 });
        var formURL = $('#change-permission').attr("action");
        $.post(formURL, postData, function (data) {
            /*console.log(data);*/
            destroyLoading();
            if (data == 1) {
                /*showAlert("Cập nhật thành công");*/
                toastr.success('Cập nhật thành công', 'Thông báo');
                setTimeout(function(){ window.location = '{base_url()}admin/users/view'; }, 2000);
            } else{
                /*showAlert("Đã có lỗi xãy ra");*/
                toastr.warning('Đã có lỗi xãy ra', 'Thông báo');
            }
        });
    }

    function cancelChange() {
        window.location = '{base_url()}admin/users/view';
    }

    function initLoading(){
        $('.content').block({
            message: '<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>',
            themedCSS: {
                width:  '30%',
                top:    '45%',
                left:   '45%'
            },
            css: {
                border: 'none',
                background: 'none',
                color: '#ffffff'
            }
        });
    }

    function destroyLoading(){
        $('.content').unblock();
    }
</script>