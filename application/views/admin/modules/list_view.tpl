<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Tech 4rum
        <small>Danh sách số điện thoại</small>
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
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Tìm kiếm</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-xs" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-xs" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form action="list_view" method="get" id="filter-form">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-10">
                                        <label for="exampleInputEmail1">Điện thoại</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="Nhập số điện thoại cần tìm" >
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="exampleInputEmail1">Tình trạng</label>
                                        <select id="status" name="status" class="form-control">
                                            <option value="-1">Tất cả</option>
                                            <option value="0">Chưa trúng</option>
                                            <option value="1">Chưa xác nhận</option>
                                            <option value="2">Đã trúng</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <button form="filter-form" type="submit" class="btn btn-success">Tìm</button>
                                        <button form="filter-form" onclick="refreshPage();" class="btn btn-success">Làm mới</button>
                                        <button form="filter-form" onclick="doExport();" class="btn btn-success">Export</button>
                                        {if not empty($permission['import'])}
                                            <a href="{base_url()}/media/files/4rumTemplate.txt" download class="btn btn-success">Download Template</a>
                                            <a id="btnImport" href="#" class="btn btn-success">Import</a>
                                            <input id="fImport" type="file" value="import" style="opacity:0; pointer-events: none; position: absolute;" />
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Danh sách điện thoại</h3>
                </div>
                <div class="box-body">
                    <table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" id="data-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Điện thoại</th>
                            <th>Tình trạng</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div id="page-selection" style="float:right;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    var currPage = 1;
    var currTable = null;
    var sortIndex = 0;
    var sortType = 'desc';
    var flagLoading = false;
    $('#btnImport').click(function(e){
        $('#fImport').click();
    });
    $('#fImport').change(function(e){
        initLoading();
        files = e.target.files;
        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            formData.append('upfiles', file, file.name);
        }
        $.ajax({
            url: 'import',
            type: 'POST',
            data: formData,
            async: false,
            success: function (data) {
                destroyLoading();
                if(data > 0){
                    toastr.success('Import thành công', 'Thông báo');
                    setTimeout(function(){ location.reload(); }, 1000);
                } else{
                    toastr.warning('Import chưa được', 'Thông báo');
                }
            },
            error: function(err){
                console.log(err.message);
            },
            cache: false,
            contentType: false,
            processData: false
        });
    });
    function getData(page){
        if(flagLoading == true){
            return;
        }
        initLoading();
        flagLoading = true;
        var filterList = { phone:$('#phone').val(), status:$('#status').val(), page:page, sort:sortIndex, type:sortType };
        window.location.hash = $('#phone').val()+'+'+$('#status').val()+'+'+page;
        $.ajax({
            url: 'data',
            type: 'POST',
            data: filterList,
            dataType: 'JSON',
            async: true,
            success: function (data) {
                var domTable = $('#data-table');
                genTable(domTable, data);
                flagLoading = false;
                destroyLoading();
            },
            error: function(err){
                flagLoading = false;
                console.log(err.message);
                destroyLoading();
            },
        });
    }
    $('#filter-form').submit(function(e){
        e.preventDefault();
        getData(1);
    });
    function genTable(domTable, data){
        if(currTable != null){
            domTable.dataTable().fnDestroy();
            domTable.find('tbody').html(data.html);
        }
        currTable = domTable.dataTable({
            language: {
                "search": "Tìm Kiếm:",
                "paginate": {
                    "first": "Trang Đầu",
                    "last": "Trang Cuối",
                    "next": "Tiếp",
                    "previous": "Lùi"
                },
                "info": "Hiện _START_ đến _END_ của _TOTAL_ dòng",
                "emptyTable": "Không có dữ liệu",
                "lengthMenu": "Hiện _MENU_ dòng",
                "infoFiltered":   "(Đã lọc từ tổng _MAX_ dòng)",
            },
            filter: false,
            bPaginate: false,
            bInfo: false,
            /*pageLength: data.per,*/
            /*lengthMenu: [[20, 40, 100, -1], [20, 40, 100, "All"]],*/
            order: [ [data.sort, data.type] ],
            /*dom: 'Bfrtip',*/
            /*buttons: [
                'csv', 'excel', 'pdf', 'print'
            ],*/
            destroy: true,
        });
        if(data.num == 0){
            $('#page-selection').hide();
        } else{
            $('#page-selection').show();
            $('#page-selection').bootpag({
                page: data.page,
                total: data.num,
                maxVisible: 10
            }).on("page", function(event, num){
                getData(num);
            });
            currTable.on('click', 'th', function(e) {
                var info = currTable.fnSettings().aaSorting;
                sortIndex = info[0][0];
                sortType = info[0][1];
                if(sortType == null){
                    sortType = 'desc';
                }
                getData(1);
            });
            currTable.on('click.DT', function(e) {
                e.preventDefault();
                return false;
            });
        }
    }

    function confirmLucky(id){
        initLoading();
        var pushList = { id:id };
        $.ajax({
            url: 'confirm',
            type: 'POST',
            data: pushList,
            async: true,
            success: function (data) {
                console.log(data);
                flagLoading = false;
                /*destroyLoading();*/
                if(data == 1){
                    toastr.success('Xác nhận thành công', 'Thông báo');
                    getData(1);
                }
            },
            error: function(err){
                flagLoading = false;
                console.log(err.message);
                destroyLoading();
                toastr.warning('Xác nhận chưa được', 'Thông báo');
            },
        });
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
    function refreshPage(){
        $('#phone').val('');
        $('#status').val(-1);
        getData(1);
    }

    $(document).ready(function() {
        currTable = $('#data-table').dataTable({ filter: false, bPaginate: false, bInfo: false });
        var hashtag = window.location.hash;
        hashtag = hashtag.split('+');
        if(typeof hashtag[0] === 'string'){
            var phone = hashtag[0].replace('#', '');
            if(phone != ''){
                $('#phone').val(phone);
            }
        }
        var tmpage = 1;
        if(typeof hashtag[1] === 'string'){
            var status = hashtag[1];
            if(status != ''){
                $('#status').val(status);
            }
        }
        if(typeof hashtag[2] === 'string'){
            if(hashtag[2] != ''){
                tmpage = hashtag[2];
            }
        }
        getData(tmpage);
    });
</script>