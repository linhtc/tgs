<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Danh mục
        <small>Cài đặt</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
        <li>Hệ thống</li>
        <li class="active">Danh mục</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Thao tác</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-info btn-xs" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-xs" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form action="#" method="get" id="filter-form">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="slModule">Tên danh mục</label>
                                        <input type="text" class="form-control params" id="menu_name" >
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="slFunction">Module</label>
                                        <select id="module" class="form-control params selectpicker" >
                                            <option value=""></option>
                                            {foreach from=$moduleList key=module item=functions}
                                                <option value="{$module}">{$module}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="functions">Quyền</label>
                                        <select id="functions" class="form-control params selectpicker" disabled multiple >

                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="slFunction">Đường dẫn</label>
                                        <input type="text" class="form-control params" id="router" placeholder="Nhập router" >
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="slFunction">Icon</label>
                                        <input type="text" class="form-control params" id="icon" placeholder="fa-folder" >
                                    </div>
                                    <div class="col-md-12">
                                        <a class="btn btn-success" onclick="addMenu();">Thêm</a>
                                        <a class="btn btn-success" id="edit-confirm">Sửa</a>
                                        <a class="btn btn-success" id="del-confirm">Xóa</a>
                                        <a class="btn btn-success" onclick="applyChange();">Áp dụng</a>
                                        <a class="btn btn-success" onclick="resetState();">Làm mới</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Ghi chú: Kéo thả để phân cấp, sắp xếp. Click chọn để thao tác.</h3>
                </div>

                <div class="box-body table-responsive no-padding" style="overflow-y: hidden;">
                    <div id="jstree">

                    </div>
                </div>

                <div class="box-footer">
                </div>

                <div class="box-footer clearfix">
                </div>

                <form action="{base_url()}admin/groups/submit_change_permission" method="post" id="change-permission">
                    <input type="hidden" name="id" id="id" value="{$id}">
                    <input type="hidden" name="permissions" id="permissions" value="{$id}">
                </form>

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
    var menuList = '{$menuList}';
    menuList = JSON.parse(menuList);
    var moduleList = '{$moduleListString}';
    moduleList = JSON.parse(moduleList);
    var menuMap = '{$menuMapString}';
    menuMap = JSON.parse(menuMap);
    var maxID = parseInt('{$maxID}');
    var selectedID = undefined;

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
    function addMenu(){
        var items = $('#jstree').jstree('get_selected');
        var ilen = items.length;
        if(ilen > 1){
            toast.warning('Chỉ chọn một thư mục chứa', 'Cảnh báo');
            return false;
        }
        var parentID = '#', iconSet = 'glyphicon glyphicon-hdd';
        if(ilen == 1){
            parentID = items[0];
        }
        var menuName = $('#menu_name').val();
        var router = $('#router').val();
        var icon = $('#icon').val();
        var module = $('#module').selectpicker('val');
        var functions = $('#functions').selectpicker('val');
        var maps = null;
        var address = null;
        maxID++;
        if(functions != null){
            maps = { };
            address = { };
            var funcNames = moduleList[module];
            iconSet = 'glyphicon glyphicon-pushpin';
            if(functions.length == 1) {
                maps[functions[0]] = funcNames[functions[0]];
                address[functions[0]] = menuList.length - 1;
            }
            if(functions.length > 1) {
                iconSet = 'glyphicon glyphicon-flash';
                for(var ii=0; ii<functions.length; ii++){
                    var fKey = functions[ii];
                    var fText = funcNames[functions[ii]];
                    var idTmp = fKey+'_X_'+maxID;
                    menuList.push({ id: idTmp, parent: maxID, text: fText, icon: iconSet, key: fKey });
                    maps[functions[ii]] = fText;
                    address[functions[ii]] = menuList.length - 1;
                }
                iconSet = 'glyphicon glyphicon-pushpin';
            }
        }
        menuList.push({ id: maxID, parent: parentID, text: menuName, icon: iconSet });
        var index = menuList.length - 1;
        menuMap[maxID] = { id: maxID, parent: parentID, text: menuName, functions: functions, maps: maps, address: address, icon: icon, module: module, router: router, index: index };
        $("#jstree").jstree(true).settings.core.data = menuList;
        $("#jstree").jstree(true).refresh();
        var node = $('#jstree').jstree(true).get_node(maxID);
        console.log(node);
    }
    function editMenu(){
        if(selectedID != undefined){
            var nodeInMap = menuMap[selectedID];
            if(typeof nodeInMap === 'object'){
                var nodeInTree = $('#jstree').jstree(true).get_node(selectedID);
                var nodeAddress = nodeInMap.address;
                var nodeMap = null;
                var menuName = $('#menu_name').val();
                var icon = $('#icon').val();
                var router = $('#router').val();
                var module = $('#module').selectpicker('val');
                if(typeof nodeAddress === 'object'){
                    var functions = $('#functions').selectpicker('val');
                    var funcNames = moduleList[module];
                    if(functions != null){
                        if(functions.length == 1){
                            nodeMap = { };
                            nodeMap[functions[0]] = funcNames[functions[0]];
                        } else {
                            for(var key in nodeAddress){
                                if(nodeAddress.hasOwnProperty(key)){
                                    var addressID = nodeAddress[key];
                                    var nodeInList = menuList[addressID];
                                    if(typeof nodeInList === 'object'){
                                        nodeInList['state'] = { hidden: true, selected: false };
                                        menuList[addressID] = nodeInList;
                                    }
                                }
                            }
                            nodeMap = { };
                            var nodeInList = menuList[nodeInMap.index];
                            if(typeof nodeInList === 'object'){
                                var funcTmp = nodeInList.id;
                                funcTmp = funcTmp.split('_X_');
                                if(typeof funcTmp[0] === 'string'){
                                    if(typeof nodeAddress[funcTmp[0]] === 'number'){
                                        delete nodeAddress[funcTmp[0]];
                                    }
                                }
                                nodeInList['state'] = { hidden: false, selected: true };
                                nodeInList['id'] = nodeInMap.id;
                                nodeInTree.id = nodeInMap.id;
                                menuList[nodeInMap.index] = nodeInList;
                                delete menuMap[selectedID];
                                selectedID = nodeInMap.id;
                            }
                            functions.forEach(function(value, index){
                                var fKey = value;
                                var fText = funcNames[value];
                                var idTmp = fKey+'_X_'+nodeInMap.id;
                                var iconSet = 'glyphicon glyphicon-flash';
                                var item = { id: idTmp, parent: nodeInTree.id, text: fText, icon: iconSet, key: fKey };
                                if(nodeAddress.hasOwnProperty(fKey)){
                                    menuList[nodeAddress[fKey]] = item;
                                    nodeMap[value] = fText;
                                    nodeAddress[value] = nodeAddress[fKey];
                                } else{
                                    menuList.push(item);
                                    nodeMap[value] = fText;
                                    nodeAddress[value] = menuList.length - 1;
                                }
                            });
                        }
                    }
                    nodeInMap['functions'] = functions;
                    nodeInMap['maps'] = nodeMap;
                    nodeInMap['address'] = nodeAddress;
                }
                nodeInMap['icon'] = icon;
                nodeInMap['module'] = module;
                nodeInMap['router'] = router;
                nodeInMap['text'] = menuName;
                menuMap[selectedID] = nodeInMap;

                var nodeInList = menuList[nodeInMap.index];
                if(typeof nodeInList === 'object'){
                    nodeInList['text'] = menuName;
                    menuList[nodeInMap.index] = nodeInList;
                }

                var newSelectedID = selectedID;
                $("#jstree").jstree(true).settings.core.data = menuList;
                $("#jstree").jstree(true).refresh();
                setTimeout(function(){
                    $('#jstree').jstree('deselect_node', selectedID);
                    $('#jstree').jstree('select_node', newSelectedID);
                }, 100);
            } else {
                toastr.warning('Chọn menu đối tượng và phân quyền lại', 'Thông báo');
            }
        }
    }
    function deleteMenu(){
        if(selectedID != undefined){
            var nodeInMap = menuMap[selectedID];
            if(typeof nodeInMap === 'object'){
                var nodeInTree = menuList[nodeInMap.index];
                if(typeof nodeInTree === 'object'){
                    nodeInTree['state'] = { hidden: true };
                    menuList[nodeInMap.index] = nodeInTree;
                    $("#jstree").jstree(true).settings.core.data = menuList;
                    $("#jstree").jstree(true).refresh();
                }
            } else {
                var nodeInMap = $('#jstree').jstree(true).get_node(selectedID);
                var nodeParentID = nodeInMap.parent;
                var nodeID = nodeInMap.id;
                nodeID = nodeID.split('_X_');
                var nodeKey = nodeID[0];
                var nodeParent = menuMap[nodeParentID];
                var nodePFuncs = nodeParent.functions;
                var nodeMap = nodeParent.maps;
                var nodeAddress = nodeParent.address;
                var nodeListIndex = nodeAddress[nodeKey];
                delete nodeMap[nodeKey];
                delete nodeAddress[nodeKey];
                var index = nodePFuncs.indexOf(nodeKey);
                if(index!=-1){
                    nodePFuncs.splice(index, 1);
                }
                nodeParent.functions = nodePFuncs;
                nodeParent.maps = nodeMap;
                nodeParent.address = nodeAddress;
                menuMap[nodeParentID] = nodeParent;
                var nodeInTree = menuList[nodeListIndex];
                if(typeof nodeInTree === 'object'){
                    nodeInTree['state'] = { hidden: true };
                    menuList[nodeInMap.index] = nodeInTree;
                    $("#jstree").jstree(true).settings.core.data = menuList;
                    $("#jstree").jstree(true).refresh();
                }
            }
        }
    }
    function moveMenu(currID, parID, e){
        var currNode = menuMap[currID];
        var parNode = menuMap[parID];
        if(typeof currNode === 'object' && typeof parNode === 'object'){
            if((currNode.router == '' || currNode.router != '') && parNode.router != ''){
                toastr.warning('Url chỉ chứa chức năng, không chứa danh mục', 'Cảnh báo');
                e.preventDefault();
                $("#jstree").jstree(true).settings.core.data = menuList;
                $("#jstree").jstree(true).refresh();
                return false;
            }
        }
        if(parNode == undefined && typeof currNode === 'object' && currNode.parent != '#'){
            var nodeInMap = $('#jstree').jstree(true).get_node(parID);
            if(typeof nodeInMap === 'object' && nodeInMap.id != '#'){
                toastr.warning('Chức năng không thể chứa cả url và danh mục', 'Cảnh báo');
                e.preventDefault();
                $("#jstree").jstree(true).settings.core.data = menuList;
                $("#jstree").jstree(true).refresh();
                return false;
            }
        }
        if(currNode == undefined){
            toastr.warning('Chức năng chỉ biểu thị cho quyền của danh mục, không thể thao tác được', 'Cảnh báo');
            e.preventDefault();
            $("#jstree").jstree(true).settings.core.data = menuList;
            $("#jstree").jstree(true).refresh();
            return false;
        }
        var deepTree = $('#jstree').jstree(true).get_json($('#jstree'), { flat: true, no_state: false, no_children: false, no_data: true, no_li_attr: true, no_a_attr: true });
        if(typeof deepTree === 'object'){
            deepTree.forEach(function(item, index){
                if(menuMap.hasOwnProperty(item.id)){
                    var iMap = menuMap[item.id];
                    iMap.index = index;
                    iMap.parent = item.parent;
                    menuMap[item.id] = iMap;
                } else if(menuMap.hasOwnProperty(item.parent)){
                    var id = item.id;
                    if(id.indexOf('_X_')){
                        id = id.split('_X_');
                        item.id = id[0];
                        var iPmap = menuMap[item.parent];
                        var iIndex = iPmap.address;
                        iIndex[item.id] = index;
                        iPmap.address = iIndex;
                        menuMap[item.parent] = iPmap;
                    }
                }
            });
            menuList = deepTree;
        }
    }
    function selectedMenu(){
        var currItem = menuMap[selectedID];
        if(currItem != undefined){
            var currName = currItem.text;
            var currPers = currItem.functions;
            var currModule = currItem.module;
            var currRouter = currItem.router;
            var currIcon = currItem.icon;
            $('#module').selectpicker('val', currModule);
            $('#menu_name').val(currName);
            $('#router').val(currRouter);
            $('#icon').val(currIcon);
            initPerFromModule($('#functions'), currModule);
            $('#functions').prop('disabled', false);
            $('#functions').selectpicker('refresh');
            $('#functions').selectpicker('val', currPers);
        } else {
            $('.params').val('');
            $('.selectpicker').selectpicker('deselectAll');
            $('#module').selectpicker('val', []);
            $('#functions').prop('disabled', true);
            $('#functions').selectpicker('refresh');
        }
    }
    function resetState(){
        $("#jstree").jstree(true).settings.core.data = menuList;
        $("#jstree").jstree(true).deselect_all();
        $("#jstree").jstree(true).refresh();
        $('.params').val('');
        $('.selectpicker').selectpicker('deselectAll');
        $('#module').selectpicker('val', []);
        $('#functions').prop('disabled', true);
        $('#functions').selectpicker('refresh');
        return false;
    }
    function applyChange(){
        initLoading();
        var deleteList = { };
        var deepTree = $('#jstree').jstree(true).get_json($('#jstree'), { flat: true, no_state: false, no_children: false, no_data: true, no_li_attr: true, no_a_attr: true });
        if(typeof deepTree === 'object'){
            deepTree.forEach(function(item, index){
                var cid = item.id;
                var pid = item.parent;
                var state = item.state;
                var deleted = state.hidden == true ? 1 : (deleteList[pid] == 1 ? 1 : 0);
                if(deleted == 1){
                    deleteList[cid] = 1;
                }
                if(typeof menuMap[cid] === 'object'){
                    menuMap[cid]['sort'] = index + 1;
                    menuMap[cid]['deleted'] = deleted;
                }
            });
        }
        var maps = JSON.stringify(menuMap);
        $.post('apply', { maps: maps }, function (data) {
            /*console.log(data);*/
            destroyLoading();
            if (data == 1) {
                /*showAlert("Cập nhật thành công");*/
                toastr.success('Cập nhật thành công', 'Thông báo');
            } else{
                /*showAlert("Đã có lỗi xãy ra");*/
                toastr.warning('Đã có lỗi xãy ra', 'Thông báo');
            }
        });
        return false;
    }
    function initPerFromModule(obj, module){
        var optionString = '';
        if(typeof moduleList[module] === 'object'){
            var functionList = moduleList[module];
            for(var key in functionList){
                if(functionList.hasOwnProperty(key)){
                    optionString += '<option value="'+key+'">'+functionList[key]+'</option>';
                }
            }
        }
        if(optionString != ''){
            obj.html(optionString);
        }
    }

    $(document).ready(function() {
        $('#jstree').jstree({
            'core' : { 'data' : menuList, "check_callback" : true, },
            'ui': { select_multiple_modifier : false },
            "plugins" : [ "dnd" ]
        }).on('changed.jstree', function (e, data) {
            if(data.selected.length == 1) {
                selectedID = data.selected[0];
                selectedMenu();
            }
        }).bind('select_node.jstree', function(e, data){
            if(data.selected.length > 1){
                data.instance.deselect_node( [ data.selected[0] ] );
            }
        }).bind("move_node.jstree", function(e, data) {
            console.log("Drop node " + data.node.id + " to " + data.parent);
            moveMenu(data.node.id, data.parent, e);
        });
        /*$(document).bind("dnd_start.vakata", function(e, data) { }).bind("dnd_move.vakata", function(e, data){ $(data.event.target).text(); }).bind("dnd_stop.vakata", function(e, data) { });*/

        $('#module').selectpicker({
            size: 10,
            liveSearch: true,
            noneSelectedText: 'Chọn một module'
        }).on('hidden.bs.select', function (e){
            var module = $('#module').selectpicker('val');
            if(module == ''){
                $('#functions').prop('disabled', true);
                $('#functions').html('');
                $('#functions').selectpicker('refresh');
                return;
            }
            initPerFromModule($('#functions'), module);
            $('#functions').prop('disabled', false);
            $('#functions').selectpicker('refresh');
            $('#functions').selectpicker('deselectAll');
        });
        $('#functions').selectpicker({
            size: 10,
            liveSearch: true,
            noneSelectedText: 'Chọn ít nhất một quyền'
        });

        $('#del-confirm').confirmation({
            onShow: function(event, element) {
                if(selectedID == undefined){
                    event.preventDefault();
                    setTimeout(function(){ $('#del-confirm').click(); }, 10);
                    toastr.warning('Click chọn một node để xóa', 'Thông báo');
                }
            },
            onConfirm: function(event, element) {
                deleteMenu();
            },
            onCancel: function() {

            },
            popout: true,
            title: 'Chắc chắn xóa?',
            placement: 'top',
            btnOkLabel: 'Đồng ý',
            btnCancelLabel: 'Hủy bỏ',
        });
        $('#edit-confirm').confirmation({
            onShow: function(event, element) {
                if(selectedID == undefined){
                    event.preventDefault();
                    setTimeout(function(){ $('#edit-confirm').click(); }, 10);
                    toastr.warning('Click chọn một node để sửa', 'Thông báo');
                }
            },
            onConfirm: function(event, element) {
                editMenu();
            },
            onCancel: function() {

            },
            popout: true,
            title: 'Xác nhận cập nhật?',
            placement: 'top',
            btnOkClass: 'btn btn-sm btn-info',
            btnOkLabel: 'Đồng ý',
            btnCancelLabel: 'Hủy bỏ',
        });
    });
</script>