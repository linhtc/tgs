<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Module
        <small>Thêm mới</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 500CMS</a></li>
        <li class="active">Cấu hình</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Tạo quyền</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body pad">
                    <div class="col-md-6">
                        <form>
                            <div class="form-group">
                                <label for="slModule">Key</label>
                                <input type="text" class="form-control params" id="permission_key" name="permission_key" notnull >
                            </div>

                            <div class="form-group">
                                <label for="slFunction">Tên</label>
                                <input type="text" class="form-control params" id="permission_name" name="permission_name" notnull >
                            </div>

                        </form>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-success" onclick="funcSubmit();">Thực hiện</button>
                    <button type="submit" class="btn btn-danger" onclick="funcCancel();">Hủy bỏ</button>
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
    function funcSubmit() {
        var params = getParams();
        if(params === false){
            toastr.warning('Kiểm tra lại dữ liệu nhập vào', 'Thông báo');
            return false;
        }
        initLoading();
        $.post('add', params, function (data) {
            destroyLoading();
            if (data == 1) {
                toastr.success('Thực hiện thành công!', 'Thông báo');
            } else{
                toastr.error(data, 'Thông báo');
            }
        });
    }

    function funcCancel() {
        window.location = '{base_url()}admin/permissions/view';
    }

    function initLoading(){
        $('.content').block({
            message: '<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>',
            themedCSS: { width:  '30%', top:    '45%', left:   '45%' },
            css: { border: 'none', background: 'none', color: '#ffffff' }
        });
    }

    function destroyLoading(){
        $('.content').unblock();
    }

    function getParams(){
        var params = { };
        $( ".params" ).each(function( index ) {
            var proptype = $( this ).prop('type'), cvalue = $( this ).val(), cid = $( this ).attr('id');
            if(proptype == undefined){ proptype = ''; }
            if(proptype.indexOf('select') >= 0){ cvalue = $( this ).selectpicker('val'); }
            var notnull = $( this ).attr('notnull');
            if(notnull != undefined && cid != null && (cvalue == null || cvalue == '')){ params = false; return false; }
            if(cid != null && cid != '') { params[cid] = cvalue; }
        });
        return params;
    }

    $(document).ready(function() {

    });
</script>