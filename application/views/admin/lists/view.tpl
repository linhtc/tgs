<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Quản lý Liệt kê</p>
            <div class="mdc-card mdc-card--portal-fullheight">
                <table class="mdl-data-table table" id="infoTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Loại</th>
                        <th>Biểu tượng</th>
                        <th>Tên</th>
                        <th>Tóm tắt</th>
                        <th>Nội dung</th>
                        <th>Sắp xếp</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="k">Loại</th>
                        <th abbr="i">Hình biểu tượng</th>
                        <th abbr="t">Tên</th>
                        <th abbr="s">Tóm tắt</th>
                        <th abbr="c">Nội dung</th>
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
                                                        <li class="mdc-list-item" id="kind-intro" role="option" tabindex="0" value="intro">intro</li>
                                                        <li class="mdc-list-item" id="kind-design" role="option" tabindex="0" value="design">design</li>
                                                        <li class="mdc-list-item" id="kind-technology" role="option" tabindex="0" value="technology">technology</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="kind-validation-msg" style="margin-top:8px;">Chọn một loại</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="icon" type="text" aria-controls="icon-validation-msg"><label class="mdc-floating-label" for="icon">Biểu tượng</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="icon-validation-msg">Nhập một mã icon</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="title" required="" type="text" aria-controls="title-validation-msg"><label class="mdc-floating-label" for="title">Tên</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="title-validation-msg">Nhập một tiêu đề</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="sort" type="number" aria-controls="sort-validation-msg"><label class="mdc-floating-label" for="sort">Sắp xếp</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="sort-validation-msg">Số sắp xếp theo ASC</p>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="sub" required="" type="text" aria-controls="sub-validation-msg"><label class="mdc-floating-label" for="sub">Tóm tắt</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="sub-validation-msg">Nhập thể hiện vắn tắt</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="content" required="" rows="10" aria-controls="content-validation-msg"></textarea>
                                                <label class="mdc-floating-label" for="content">Nội dung</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="content-validation-msg" style="display: none;">Nhập nội dung</p>
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
    </div>
</div>

<script type="text/javascript">
    _thatUrl = window.location.pathname.toString() + '/';
    _permission = '{$permission}';
    _infoTable = null;
    _this = null;
    _buttons = [];
    _dialog = null;
</script>