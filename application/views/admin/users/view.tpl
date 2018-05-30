<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Nhóm
        <small>Danh sách</small>
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
                                    <div class="form-group col-md-6">
                                        <label for="username">Tài khoản</label>
                                        <input id="username" type="text" class="form-control params" placeholder="Nhập vào tên đăng nhập">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="surname">Họ tên</label>
                                        <input id="surname" type="text" class="form-control params" placeholder="Nhập vào họ và tên">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="group">Nhóm</label>
                                        <select id="group" class="form-control params selectpicker" multiple>
                                            {foreach from=$groupList key=i item=item}
                                                <option value="{$item.id}">{$item.gname}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="locked">Trạng thái</label>
                                        <select id="locked" class="form-control params selectpicker" multiple>
                                            <option value="0">Kích hoạt</option>
                                            <option value="1">Bị khóa</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <button form="filter-form" onclick="getData(1);" class="btn btn-success">Tìm kiếm</button>
                                        <button form="filter-form" onclick="refreshPage();" class="btn btn-success">Làm mới</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Danh sách người dùng</h3>
                </div>
                <div class="box-body">
                    <table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" id="data-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tài khoản</th>
                            <th>Họ tên</th>
                            <th>Nhóm</th>
                            <th>Tình trạng</th>
                            <th>Các chức năng</th>
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
    var currTable = null;
    var flagLoading = false;
    var filterList = { page: 1, sort:0, type:'desc' };

    function getData(page){
        if(flagLoading == true){
            return;
        }
        filterList['page'] = page;
        genParams();
        initLoading();
        flagLoading = true;
        window.history.replaceState(null, null, 'view?'+genSearchUrl(filterList));
        $.ajax({
            url: 'data',
            type: 'POST',
            data: filterList,
            dataType: 'JSON',
            async: true,
            success: function (data) {
                var domTable = $('#data-table');
                genTable(domTable, data);
                genDelConfirm();
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
        if(data.num < 2){
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
                var sortIndex = info[0][0];
                var sortType = info[0][1];
                if(sortType == null){ sortType = 'desc'; }
                filterList['sort'] = sortIndex;
                filterList['type'] = sortType;
                getData(1);
            });
            currTable.on('click.DT', function(e) {
                e.preventDefault();
                return false;
            });
        }
    }
    function genDelConfirm(){
        $('.a-confirmation').confirmation({
            onConfirm: function(event, element) {
                var delID = $(element[0]).attr('del-id');
                var delStatus = $(element[0]).attr('del-status');
                $.post('status', { id: delID, status: delStatus }, function (data) {
                    destroyLoading();
                    if (data == 1) {
                        toastr.success('Thực hiện thành công!', 'Thông báo');
                        refreshPage();
                    } else{
                        toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau!', 'Thông báo');
                    }
                });
            },
            onCancel: function() {

            },
            popout: true,
            title: 'Xác nhận đổi trạng thái?',
            placement: 'top',
            btnOkClass: 'btn btn-sm btn-success',
            btnOkLabel: 'Đồng ý',
            btnCancelLabel: 'Hủy bỏ',
        });
    }
    function genSearchUrl(jObject){
        var searchString = '';
        for(var key in jObject){
            if(jObject.hasOwnProperty(key)){
                searchString += (searchString == '' ? '' : '&') +key+'='+jObject[key];
            }
        }
        return searchString;
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
        filterList['sort'] = 0;
        filterList['type'] = 'desc';
        $('.params').val('');
        $('.selectpicker').selectpicker('deselectAll');
        getData(1);
    }
    function genParams(){
        $( ".params" ).each(function( index ) {
            var proptype = $( this ).prop('type'), cvalue = $( this ).val(), cid = $( this ).attr('id');
            if(proptype == undefined){ proptype = ''; }
            if(proptype.indexOf('select') >= 0){ cvalue = $( this ).selectpicker('val'); }
            if(cvalue === null){ cvalue= ''; }
            if(cid != null && cid != '') { filterList[cid] = cvalue; }
        });
    }

    $(document).ready(function() {
        $('#group').selectpicker({
            size: 10,
            liveSearch: true,
            noneSelectedText: 'Chọn nhóm'
        }).on('hidden.bs.select', function (e){
            /*console.log($('#slModule').selectpicker('val'));*/
        });
        $('#locked').selectpicker({
            size: 10,
            liveSearch: true,
            noneSelectedText: 'Chọn trạng thái'
        }).on('hidden.bs.select', function (e){
            /*console.log($('#slModule').selectpicker('val'));*/
        });
        $('.selectpicker').selectpicker('deselectAll');
        $('#filter-form').submit(function(e){
            e.preventDefault();
            filterList['sort'] = 0;
            filterList['type'] = 'desc';
            getData(1);
        });
        currTable = $('#data-table').dataTable({ filter: false, bPaginate: false, bInfo: false });
        var hashtag = window.location.hash;
        hashtag = hashtag.split('+');
        var query = location.search.substr(1);
        query.split("&").forEach(function(part) {
            var item = part.split("=");
            if(typeof filterList[item[0]] !== 'undefined' && item[1] != undefined && item[1] != null){ filterList[item[0]] = decodeURIComponent(item[1]); }
            if(typeof $('#'+item[0]).attr('id') === 'string' && item[1] != undefined && item[1] != null){
                var cvalue = decodeURIComponent(item[1]);
                if($('#'+item[0]).prop('type') == 'select-multiple'){
                    $('#'+item[0]).selectpicker('val', cvalue.split(','));
                } else{
                    $('#'+item[0]).val(cvalue);
                }
            }
        });
        getData(filterList['page']);
    });
</script>