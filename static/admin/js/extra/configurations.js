if (!isNaN(_permission) || _permission.create !== undefined) {
    _buttons.push({
        text: 'Tạo',
        action: function (e, dt, node, config) {
            $('#infoModalTitle').text('Thêm mới');
            $('#infoError').text('').hide();
            $('.params:input:not([type=radio])').val('');
            _dialog.lastFocusedTarget = e.target;
            _dialog.show();
        }
    });
}
if (!isNaN(_permission) || _permission.edit !== undefined) {
    _buttons.push({
        text: 'Sửa',
        action: function (e, dt, node, config) {
            let rowSelected = $('#infoTable').find('.selected td:nth-child(2)');
            if (rowSelected.length !== 1) {
                $('.notifyjs-wrapper').remove();
                node.notify('Chọn duy nhất 1 dòng!', {className: 'error', position: 'top center'});
            } else {
                rowSelected.each(function () {
                    let item = _infoTable.row(this).data();
                    $.ajax({
                        type: 'post',
                        url: _thatUrl+'data',
                        data: {_id: item[1]},
                        dataType: 'json',
                        success: function (result) {
                            if (result.status === 1) {
                                let item = result.item;
                                Object.keys(item).forEach(function (key) {
                                    let keyID = '#' + key;
                                    $(keyID).val(item[key]);
                                    $(keyID).parent().find('label').addClass('mdc-floating-label--float-above');
                                });
                                $('#infoModalTitle').text('Sửa lại');
                                $('#infoError').text('').hide();
                                _dialog.lastFocusedTarget = e.target;
                                _dialog.show();
                            } else {
                                node.notify(result.message, {className: 'error', position: 'top center'});
                            }
                        },
                        error: function (XMLHttpRequest) {
                            node.notify(XMLHttpRequest.statusText, {className: 'error', position: 'top center'});
                        }
                    });
                    return true;
                });
            }
        }
    });
}
if (!isNaN(_permission) || _permission.remove !== undefined) {
    _buttons.push({
        text: 'Xóa',
        action: function (e, dt, node, config) {
            let rowSelected = $('#infoTable').find('.selected td:nth-child(2)');
            if (rowSelected.length < 1) {
                $('.notifyjs-wrapper').remove();
                node.notify('Ít nhất 1 dòng. Ctrl+click chọn nhiều!', {className: 'error', position: 'top center'});
            } else {
                swal({
                    title: "Chắc chắn xóa?",
                    text: "Dữ liệu đã xóa sẽ không thể phục hồi!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Xác nhận",
                    cancelButtonText: "Hủy bỏ",
                    closeOnConfirm: false,
                    closeOnCancel: true
                }, function (isConfirm) {
                    if (isConfirm) {
                        let list = [];
                        rowSelected.each(function () {
                            let item = _infoTable.row(this).data();
                            list.push(item[1]);
                        });
                        if (list.length > 0) {
                            $.ajax({
                                type: 'post',
                                url: _thatUrl+'remove',
                                data: {list: list.toString()},
                                dataType: 'json',
                                success: function (result) {
                                    if (result.status === 1) {
                                        _infoTable.clearPipeline();
                                        _infoTable.ajax.reload();
                                        swal("Deleted!", "Dữ liệu đã được xóa!", "success");
                                    } else {
                                        swal("Cancelled", result.message, "error");
                                    }
                                },
                                error: function (XMLHttpRequest) {
                                    swal("Cancelled", XMLHttpRequest.statusText, "error");
                                }
                            });
                        }
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });
            }
        }
    });
}

$('#saveInfo').click(function () {
    let info = {};
    let allow = true;
    let params = $('.params');
    params.each(function () {
        if (this.required && this.value.length < 1) {
            let msgLabel = $(this).parent().find('.mdc-floating-label');
            if(msgLabel.length > 0){
                msgLabel = msgLabel[0].textContent+': ';
            } else{
                msgLabel = '';
            }
            let msgControl = this.getAttribute('aria-controls');
            $('#infoError').text(msgLabel+''+$('#'+msgControl).text()).hide().show(500);
            allow = false;
            return allow;
        }
        if (this.type === undefined && this.getAttribute('role') === 'listbox') {
            if(selectBag[this.id]['selectedOptions'].length > 0){
                info[this.id] = selectBag[this.id]['selectedOptions'][0]['attributes']['value']['nodeValue'];
            } else{
                info[this.id] = '';
            }
        } else if (this.type === 'radio') {
            if(this.checked){
                info[this.name] = this.value;
            }
        } else {
            info[this.id] = this.value;
        }
    });
    if (allow) {
        $('#infoError').text('').hide();
        $('#saveInfo').notify("Hệ thống đang xử lý", {className: 'info', position: 'right top'});
        $.ajax({
            type: 'post',
            url: _thatUrl + 'save',
            data: info,
            dataType: 'json',
            success: function (result) {
                if (result.status === 1) {
                    _infoTable.clearPipeline();
                    _infoTable.ajax.reload();
                    $('#saveInfo').notify(result.message, {className: 'success', position: 'right top'});
                    _dialog.close();
                } else {
                    $('#infoError').text(result.message).show(500);
                    $('#saveInfo').notify(result.message, {className: 'error', position: 'right top'});
                }
            },
            error: function (XMLHttpRequest) {
                $('#infoError').text(XMLHttpRequest.statusText).show(500);
                $('#saveInfo').notify(result.message, {className: 'error', position: 'right top'});
            }
        });
    }
});
$(document).ready(function () {
    const tfRoot = document.querySelectorAll('.mdc-text-field');
    for (let i = 0; i < tfRoot.length; i++) {
        new mdc.textField.MDCTextField(tfRoot[i]);
    }
    mdc.dialog.MDCDialog.attachTo(document.querySelector('.mdc-dialog'));
    _dialog = new mdc.dialog.MDCDialog(document.querySelector('#mdc-dialog-default'));
    _dialog.listen('MDCDialog:accept', function () {
        console.log('accepted');
    });
    _dialog.listen('MDCDialog:cancel', function () {
        console.log('canceled');
    });
    _infoTable = $('#infoTable').DataTable({
        dom: 'Bfrtip',
        bAutoWidth: false,
        processing: true,
        serverSide: true,
        ajax: $.fn.dataTable.pipeline({
            url: _thatUrl+'data',
            pages: 5, // number of pages to cache,
            data: {test: 123}
        }),
        fnInitComplete: function (oSettings) {
            setTimeout(function () {
                // language=JQuery-CSS
                $('.table tfoot th').each(function (index) {
                    if (index < 1) {
                        return;
                    }
                    let title = $(this).text();
                    let date = new Date;
                    let element = document.createElement("INPUT");
                    element.type = 'text';
                    element.classList.add('filter-data');
                    element.placeholder = 'Lọc theo ' + title;
                    element.title = 'Lọc theo ' + title;
                    element.id = Math.random() + '_' + date.getUTCMilliseconds();
                    $(this).html(element);
                });
                _infoTable.columns().every(function (index) {
                    $('input', this.footer()).val('');
                    $('input', this.footer()).on('keyup', function (e) {
                        if(e.keyCode === 13){
                            if(_infoTable !== null){
                                _infoTable.clearPipeline().draw();
                            }
                        }
                    });
                });
                $('.table').wrapAll('<div class="table-responsive"></div>');
            }, 10);
        },
        columnDefs: [{
            orderable: false,
            className: 'select-checkbox',
            targets: 0
        }, {
            targets: [1],
            visible: true
        }, {
            searchable: true,
            targets: 1
        }],
        select: {
            style: 'os'
        },
        order: [[1, 'desc']],
        pagingType: 'simple_numbers',
        buttons: _buttons
    });
    if($(window).height() < 768){
        $('.mdc-dialog__surface .mdc-dialog__body--scrollable').css('max-height', Math.floor($(window).height()*0.4));
    }
});