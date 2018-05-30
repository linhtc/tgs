<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Quyền
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
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Danh sách Quyền</h3>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered nowrap" cellspacing="0" width="100%" id="data-table">
                            <thead>
                                <tr>

                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th col-id="id">ID</th>
                                    <th col-id="key">Key</th>
                                    <th col-id="name">Tên</th>
                                    <th col-id="action">Các chức năng</th>
                                </tr>
                            </tfoot>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <div id="page-detail" style="float:left;">
                        <ul class="pagination bootpag"><li data-lp="10">Có <p class="total-rows" style="display: inline;"></p> dòng được tìm thấy</li></ul>
                    </div>
                    <div id="page-selection" style="float:right;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    var selMap = {

    };

    $(document).ready(function() {
        optimizer.prepare();

        $(dTable+' tfoot th').each( function () {
            var tmpTitle = $(this).text();
            var tmpID = $(this).attr('col-id');
            var tmpVal = typeof filterList[tmpID] !== 'undefined' ? filterList[tmpID] : '';
            var tmpSel = $(this).attr('col-sel');
            var tmpMulti = $(this).attr('col-multi');
            var element = '<input class="filter-data params" type="text" placeholder="Lọc theo '+tmpTitle+'" id="'+tmpID+'" value="'+tmpVal+'" />';
            if(tmpSel == 1){ element = '<select '+tmpMulti+' class="filter-data params selectpicker" id="'+tmpID+'" data-container="body">'+selMap[tmpID]+'</select>'; }
            if(tmpID == 'gift'){ optimizer.getGiftByCampaign(tmpVal); }
            if(tmpID == 'action'){ element = ''; }
            $(this).html( element );
            $(dTable+' thead tr').append('<th>'+tmpTitle+'</th>');
            if(tmpID == 'dt'){ optimizer.genDatePicker(tmpID); }
            if(tmpSel == 1){
                $('#'+tmpID).selectpicker({ size: 10, liveSearch: true, noneSelectedText: 'Lọc theo '+tmpTitle }).on('hide.bs.select', function () {
                    var tmpVal = $( this ).selectpicker('val');
                    var tmpVal2 = filterList[tmpID];
                    if(tmpVal == null){ tmpVal = ''; }
                    if(typeof tmpVal == 'object' && typeof tmpVal2 == 'object'){ if(tmpVal.sort().toString() == tmpVal2.sort().toString()){ return false; } }
                    if(tmpVal != tmpVal2){ optimizer.getData(1); }
                    if(tmpID == 'campaign'){ optimizer.getGiftByCampaign(); }
                });
                $('#'+tmpID).selectpicker('val', tmpVal.split(','));
            }
        } );
        $('.params').on('keyup', function (e) { if(e.keyCode == 13){ optimizer.getData(1); } });
        currTable = $(dTable).dataTable({ filter: false, bPaginate: false, bInfo: false });

        optimizer.getData(filterList['page']);
    });
</script>