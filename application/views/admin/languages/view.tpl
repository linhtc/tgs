<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Quản lý Ngôn ngữ</p>
            <div class="mdc-card mdc-card--portal-fullheight">
                <table class="mdl-data-table table" id="infoTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Từ khóa</th>
                        <th>Chú thích</th>
                        <th>Tiếng Việt</th>
                        <th>Tiếng Anh</th>
                        <th>Tiếng Nhật</th>
                        <th>Tiếng Trung</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="lang">Từ khóa</th>
                        <th abbr="note">Chú thích</th>
                        <th abbr="vi">Tiếng Việt</th>
                        <th abbr="en">Tiếng Anh</th>
                        <th abbr="jp">Tiếng Nhật</th>
                        <th abbr="cn">Tiếng Trung</th>
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
                                                <input class="params mdc-text-field__input" id="lang" required="" type="text" aria-controls="lang-validation-msg">
                                                <label class="mdc-floating-label" for="lang">Từ khóa</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="lang-validation-msg">Nhập một khóa riêng biệt để chuyển đổi ngôn ngữ</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="vi" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="vi">Tiếng Việt</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="jp" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="jp">Tiếng Nhật</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="note" type="text" aria-controls="note-validation-msg">
                                                <label class="mdc-floating-label" for="note">Chú thích</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="note-validation-msg">Ghi chú lại từ này dùng ở đâu, ...</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="en" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="en">Tiếng Anh</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="cn" rows="5"></textarea>
                                                <label class="mdc-floating-label" for="cn">Tiếng Trung</label>
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