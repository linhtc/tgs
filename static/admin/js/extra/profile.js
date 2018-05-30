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
            document.getElementById(this.id).focus();
            allow = false;
            return allow;
        }
        if (this.type === undefined && this.getAttribute('role') === 'listbox') {
            if(selectBag[this.id]['selectedOptions'].length > 0){
                info[this.id] = selectBag[this.id]['selectedOptions'][0]['attributes']['value']['nodeValue'];
            } else{
                info[this.id] = '';
                if(this.getAttribute('data-required') !== undefined){
                    let msgLabel = $(this).find('.mdc-select__label');
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
        $('#saveInfo').notify("Hệ thống đang xử lý", {className: 'info', position: 'left top'});
        $.ajax({
            type: 'post',
            url: _thatUrl + 'save',
            data: info,
            dataType: 'json',
            success: function (result) {
                if (result.status === 1) {
                    $('#saveInfo').notify(result.message, {className: 'success', position: 'left top'});
                } else {
                    $('#saveInfo').notify(result.message, {className: 'error', position: 'left top'});
                }
            },
            error: function (XMLHttpRequest) {
                $('#saveInfo').notify(result.message, {className: 'error', position: 'left top'});
            }
        });
    }
});
let selectBag = {};
$(document).ready(function () {
    const MDCSelect = mdc.select.MDCSelect;
    const selects = document.querySelectorAll('.mdc-select');
    for (let i = 0; i < selects.length; i++) {
        let sel = new MDCSelect(selects[i]);
        selectBag[sel.root_.id] = sel;
    }
    const tfRoot = document.querySelectorAll('.mdc-text-field');
    for (let i = 0; i < tfRoot.length; i++) {
        new mdc.textField.MDCTextField(tfRoot[i]);
    }
});