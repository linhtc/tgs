<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Quản lý Trang chủ</p>
            <div class="mdc-card mdc-card--portal-fullheight">
                <table class="mdl-data-table table" id="infoTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Section</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Chi tiết</th>
                        <th title="Click vào ô để xem chi tiết">Hình ảnh*</th>
                        <th>Sắp xếp</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="s">Section</th>
                        <th abbr="t">Tiêu đề</th>
                        <th abbr="ds">Mô tả</th>
                        <th abbr="dl">Chi tiết</th>
                        <th abbr="p">Hình ảnh</th>
                        <th abbr="so">Sắp xếp</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <aside class="mdc-dialog" id="mdc-dialog-default" role="alertdialog" aria-hidden="true" aria-labelledby="mdc-dialog-with-list-label" aria-describedby="mdc-dialog-with-list-description">
            <div class="mdc-dialog__surface">
                <header class="mdc-dialog__header">
                    <h2 class="mdc-dialog__header__title" id="mdc-dialog-with-list-label">Thêm/Sửa thông tin</h2>
                </header>
                <section class="mdc-dialog__body mdc-dialog__body--scrollable" id="mdc-dialog-with-list-description">
                    <div class="mdc-layout-grid" style="padding: 0;">
                        <div class="mdc-layout-grid__inner">
                            <div class="mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                <div class="mdc-layout-grid">
                                    <div class="mdc-layout-grid__inner">
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="params mdc-select" id="kind" role="listbox" data-required="" aria-controls="kind-validation-msg" style="width:100%;">
                                                <div class="mdc-select__surface" tabindex="0">
                                                    <div class="mdc-select__label mdc-select-required__label">Loại</div>
                                                    <div class="mdc-select__selected-text"></div>
                                                    <div class="mdc-select__bottom-line"></div>
                                                </div>
                                                <div class="mdc-menu mdc-select__menu">
                                                    <ul class="mdc-list mdc-menu__items">
                                                        <li class="mdc-list-item" id="kind-slider" role="option" tabindex="0" value="slider">slider</li>
                                                        <li class="mdc-list-item" id="kind-logo" role="option" tabindex="1" value="logo">logo</li>
                                                        <li class="mdc-list-item" id="kind-team" role="option" tabindex="2" value="team">team</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="kind-validation-msg" style="margin-top:8px;">Chọn một loại</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="title" required="" type="text" aria-controls="title-validation-msg">
                                                <label class="mdc-floating-label" for="title">Tên</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="title-validation-msg">Nhập một tiêu đề</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="sort" type="number" aria-controls="sort-validation-msg">
                                                <label class="mdc-floating-label" for="sort">Sắp xếp</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="sort-validation-msg">Số sắp xếp theo ASC</p>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="background" required="" type="text" aria-controls="background-validation-msg" readonly="" onclick="_dialogFile.show();">
                                                <label class="mdc-floating-label" for="background">Hình ảnh</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="background-validation-msg">Chọn một ảnh nền</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="sub" required="" rows="5" aria-controls="sub-validation-msg"></textarea>
                                                <label class="mdc-floating-label" for="sub">Tóm tắt</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="sub-validation-msg" style="display: none;">Nhập tóm tắt</p>
                                            <input class="form-control params" type="hidden" id="id">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <footer class="mdc-dialog__footer"><span class="error" id="infoError"></span><button class="mdc-button mdc-dialog__footer__button mdc-dialog__footer__button--cancel" type="button">Đóng</button><button class="mdc-button mdc-dialog__footer__button mdc-dialog__footer__button--accept-custom" id="saveInfo" type="button">Lưu</button></footer>
            </div>
            <div class="mdc-dialog__backdrop"></div>
        </aside>
        <aside class="mdc-dialog" id="mdc-dialog-file" role="alertdialog" aria-hidden="true" aria-labelledby="mdc-dialog-default-label" aria-describedby="mdc-dialog-default-description">
            <div class="mdc-dialog__surface">
                <section class="mdc-dialog__body" id="mdc-dialog-default-description" style="padding: 0; margin: 0">
                    <iframe id="iframe" src="/media/filemanager/filemanager/dialog.php?type=0&field_id=filePath&relative_url=1" style="width: 100%; height: 500px; border: none" tabindex="0"></iframe>
                </section>
            </div>
            <div class="mdc-dialog__backdrop"></div>
            <input id="filePath" type="hidden" value="">
        </aside>
    </div>
</div>

<script type="text/javascript">
    _thatUrl = window.location.pathname.toString() + '/';
    _permission = '{$permission}';
    _infoTable = null;
    _this = null;
    _buttons = [];
    _dialog = null;
    _dialogFile = null;
</script>