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
                        <th>Loại</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Ghi chú</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="k">Loại</th>
                        <th abbr="t">Tiêu đề</th>
                        <th abbr="d">Mô tả</th>
                        <th abbr="n">Ghi chú</th>
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
                                                        <li class="mdc-list-item" id="kind-article" role="option" tabindex="0" value="article">article</li>
                                                        <li class="mdc-list-item" id="kind-box" role="option" tabindex="1" value="box">box</li>
                                                        <li class="mdc-list-item" id="kind-contact" role="option" tabindex="2" value="contact">contact</li>
                                                        <li class="mdc-list-item" id="kind-free" role="option" tabindex="3" value="free">free</li>
                                                        <li class="mdc-list-item" id="kind-list_1" role="option" tabindex="4" value="list_1">list_1</li>
                                                        <li class="mdc-list-item" id="kind-list_2" role="option" tabindex="5" value="list_2">list_2</li>
                                                        <li class="mdc-list-item" id="kind-list_3" role="option" tabindex="6" value="list_3">list_3</li>
                                                        <li class="mdc-list-item" id="kind-option" role="option" tabindex="7" value="option">option</li>
                                                        <li class="mdc-list-item" id="kind-option_4" role="option" tabindex="8" value="option_4">option_4</li>
                                                        <li class="mdc-list-item" id="kind-photo" role="option" tabindex="9" value="photo">photo</li>
                                                        <li class="mdc-list-item" id="kind-product" role="option" tabindex="10" value="product">product</li>
                                                        <li class="mdc-list-item" id="kind-ref" role="option" tabindex="11" value="ref">ref</li>
                                                        <li class="mdc-list-item" id="kind-slide" role="option" tabindex="12" value="slide">slide</li>
                                                        <li class="mdc-list-item" id="kind-text" role="option" tabindex="13" value="text">text</li>
                                                        <li class="mdc-list-item" id="kind-video" role="option" tabindex="14" value="video">video</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="kind-validation-msg" style="margin-top:8px;">Chọn một loại</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="title" required="" type="text" aria-controls="title-validation-msg">
                                                <label class="mdc-floating-label" for="title">Tiêu đề</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="title-validation-msg">Nhập một tiêu đề</p>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="des" rows="3" aria-controls="des-validation-msg"></textarea>
                                                <label class="mdc-floating-label" for="des">Mô tả</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="des-validation-msg" style="display: none;">Nhập mô tả</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="note" rows="1" aria-controls="note-validation-msg"></textarea>
                                                <label class="mdc-floating-label" for="note">Ghi chú</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="note-validation-msg" style="display: none;">Nhập ghi chú</p>
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