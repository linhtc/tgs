<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Quản lý Nghề nghiệp</p>
            <div class="mdc-card mdc-card--portal-fullheight">
                <table class="mdl-data-table table" id="infoTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Người Y/C</th>
                        <th title="Click vào ô để xem chi tiết">Ảnh*</th>
                        <th>Email</th>
                        <th title="Click vào ô để xem chi tiết">Giới thiệu*</th>
                        <th>Vị trí tuyển</th>
                        <th>Kỹ năng ẩn</th>
                        <th title="Click vào ô để xem chi tiết">Kỹ năng*</th>
                        <th>Sắp xếp</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <th abbr="checker"></th>
                        <th abbr="id">ID</th>
                        <th abbr="er_n">Người Y/C</th>
                        <th abbr="er_a">Ảnh</th>
                        <th abbr="er_e">Email</th>
                        <th abbr="er_i">Giới thiệu</th>
                        <th abbr="ee_p">Vị trí tuyển</th>
                        <th abbr="ee_sh">Kỹ năng ẩn</th>
                        <th abbr="ee_s">Kỹ năng</th>
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
                                            <!--
                                            <div class="params mdc-select" id="kind" role="listbox" data-required="" aria-controls="kind-validation-msg" style="width:100%;">
                                                <div class="mdc-select__surface" tabindex="0">
                                                    <div class="mdc-select__label mdc-select-required__label">Loại</div>
                                                    <div class="mdc-select__selected-text"></div>
                                                    <div class="mdc-select__bottom-line"></div>
                                                </div>
                                                <div class="mdc-menu mdc-select__menu">
                                                    <ul class="mdc-list mdc-menu__items">
                                                        <li class="mdc-list-item" id="kind-home" role="option" tabindex="0" value="home">home</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="kind-validation-msg" style="margin-top:8px;">Chọn một loại</p>
                                            -->
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_name" required="" type="text" aria-controls="employer_name-validation-msg">
                                                <label class="mdc-floating-label" for="employer_name">Người yêu cầu</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_name-validation-msg">Ai yêu cầu tuyển dụng?</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_position" required="" type="text" aria-controls="employer_position-validation-msg">
                                                <label class="mdc-floating-label" for="employer_position">Chức vụ người Y/C</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_position-validation-msg">Chức vụ của người Y/C</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_email" required="" type="text" aria-controls="employer_email-validation-msg">
                                                <label class="mdc-floating-label" for="employer_email">Email người Y/C</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_email-validation-msg">Email của người Y/C</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_facebook" required="" type="text" aria-controls="employer_facebook-validation-msg">
                                                <label class="mdc-floating-label" for="employer_facebook">Link Facebook</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_facebook-validation-msg">Nhập url Facebook</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_twitter" required="" type="text" aria-controls="employer_twitter-validation-msg">
                                                <label class="mdc-floating-label" for="employer_twitter">Link Twitter</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_twitter-validation-msg">Nhập url Twitter</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_youtube" required="" type="text" aria-controls="employer_youtube-validation-msg">
                                                <label class="mdc-floating-label" for="employer_youtube">Link Youtube</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_youtube-validation-msg">Nhập url Youtube</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employer_avatar" required="" type="text" aria-controls="employer_avatar-validation-msg" readonly="" onclick="_dialogFile.show();">
                                                <label class="mdc-floating-label" for="employer_avatar">Hình ảnh</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_avatar-validation-msg">Nên chọn kích thước 262x365</p>
                                        </div>
                                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="employee_position" required="" type="text" aria-controls="employee_position-validation-msg">
                                                <label class="mdc-floating-label" for="employee_position">Vị trí cần tuyển</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employee_position-validation-msg">Đang cần nhân sự nào?</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="skill_1" required="" type="text" aria-controls="skill_1-validation-msg">
                                                <label class="mdc-floating-label" for="skill_1">Kỹ năng cần có 1</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="skill_1-validation-msg">Mức độ của kỹ năng cần có</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="skill_2" required="" type="text" aria-controls="skill_2-validation-msg">
                                                <label class="mdc-floating-label" for="skill_2">Kỹ năng cần có 2</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="skill_2-validation-msg">Mức độ của kỹ năng cần có</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="skill_3" required="" type="text" aria-controls="skill_3-validation-msg">
                                                <label class="mdc-floating-label" for="skill_3">Kỹ năng cần có 3</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="skill_3-validation-msg">Mức độ của kỹ năng cần có</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="skill_4" required="" type="text" aria-controls="skill_4-validation-msg">
                                                <label class="mdc-floating-label" for="skill_4">Kỹ năng cần có 4</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="skill_4-validation-msg">Mức độ của kỹ năng cần có</p>
                                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                                <input class="params mdc-text-field__input" id="sort" type="number" aria-controls="sort-validation-msg">
                                                <label class="mdc-floating-label" for="sort">Sắp xếp</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="sort-validation-msg">Số sắp xếp theo ASC</p>
                                            <div class="mdc-text-field mdc-text-field--textarea mdc-text-field--fullwidth full-width-textarea-example" style="margin-top:24px;">
                                                <textarea class="params mdc-text-field__input" id="employer_intro" required="" rows="5" aria-controls="employer_intro-validation-msg"></textarea>
                                                <label class="mdc-floating-label" for="employer_intro">Vài lời về vị trí cần tuyển</label>
                                                <div class="mdc-line-ripple"></div>
                                            </div>
                                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="employer_intro-validation-msg" style="display: none;">Nhập tóm tắt</p>
                                            <input class="form-control params" type="hidden" id="id">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <footer class="mdc-dialog__footer">
                    <span class="error" id="infoError"></span>
                    <button class="mdc-button mdc-dialog__footer__button mdc-dialog__footer__button--cancel" type="button">Đóng</button>
                    <button class="mdc-button mdc-dialog__footer__button mdc-dialog__footer__button--accept-custom" id="saveInfo" type="button">Lưu</button>
                </footer>
            </div>
            <div class="mdc-dialog__backdrop"></div>
        </aside>
        <aside class="mdc-dialog" id="mdc-dialog-file" role="alertdialog" aria-hidden="true" aria-labelledby="mdc-dialog-default-label" aria-describedby="mdc-dialog-default-description">
            <div class="mdc-dialog__surface">
                <section class="mdc-dialog__body" id="mdc-dialog-default-description2" style="padding: 0; margin: 0">
                    <iframe id="iframe" src="/media/filemanager/filemanager/dialog.php?type=0&field_id=filePath&relative_url=1" style="width: 100%; height: 500px; border: none" tabindex="0"></iframe>
                </section>
            </div>
            <div class="mdc-dialog__backdrop"></div>
            <input id="filePath" type="hidden" value="">
        </aside>
        <aside class="mdc-dialog" id="mdc-dialog-skills" role="alertdialog" aria-hidden="true" aria-labelledby="mdc-dialog-default-label" aria-describedby="mdc-dialog-default-description">
            <div class="mdc-dialog__surface">
                <section class="mdc-dialog__body" id="skillTable" style="padding: 0; margin: 0">

                </section>
            </div>
            <div class="mdc-dialog__backdrop"></div>
            <input id="filePath" type="hidden" value="">
        </aside>
        <a id="lightbox-anchor" href="" style="display: none;" data-lightbox="image-1" data-title="My caption">Image #1</a>
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
    _dialogSkill = null;
</script>