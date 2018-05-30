<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Quản lý Cấu hình</p>
            <div class="mdc-card mdc-card--portal-fullheight">
                <table class="mdl-data-table table" id="infoTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Lời nhắn</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="n">Tên</th>
                        <th abbr="e">Email</th>
                        <th abbr="m">Lời nhắn</th>
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
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="apply_key" required="" type="text" aria-controls="apply_key-validation-msg"><label class="mdc-floating-label" for="apply_key">Khóa</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="apply_key-validation-msg">Nhập một khóa riêng biệt</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="apply_value" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="apply_value">Giá trị 1</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="apply_name" required="" type="text" aria-controls="apply_name-validation-msg"><label class="mdc-floating-label" for="apply_name">Tên</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="apply_name-validation-msg">Nhập tên cho khóa</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="apply_value2" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="apply_value2">Giá trị 2</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
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
        <aside class="mdc-dialog" id="mdc-dialog-skills" role="alertdialog" aria-hidden="true" aria-labelledby="mdc-dialog-default-label" aria-describedby="mdc-dialog-default-description">
            <div class="mdc-dialog__surface">
                <section class="mdc-dialog__body" id="skillTable" style="padding: 0; margin: 0">

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
    _dialogSkill = null;
</script>