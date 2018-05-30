<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <div class="portal-widget mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-12-tablet mdc-layout-grid__cell--span-4-phone">
            <p class="portal-widget__heading mdc-typography--subheading2">Thông tin Cá nhân</p>
            <div class="mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="full_name" required="" type="text" aria-controls="full_name-validation-msg" value="{$user.full_name}">
                                <label class="mdc-floating-label" for="full_name">Họ và tên</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="full_name-validation-msg">Nhập họ và tên</p>
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="phone" required="" type="text" aria-controls="phone-validation-msg" value="{$user.phone}">
                                <label class="mdc-floating-label" for="phone">Điện thoại</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="phone-validation-msg">Nhập số di động</p>
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="email" type="email" aria-controls="email-validation-msg" value="{$user.email}">
                                <label class="mdc-floating-label" for="email">Thư điện tử</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="full_name-validation-msg">Nhập email</p>
                        </div>
                        <div class="mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone">
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="dob" type="text" {literal}pattern="(\d{4})-(\d{2})-(\d{2})"{/literal} aria-controls="dob-validation-msg" value="{$user.dob}">
                                <label class="mdc-floating-label" for="dob">Ngày sinh</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="dob-validation-msg">Nhập năm-tháng-ngày sinh</p>
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="username" required="" type="text" readonly="" aria-controls="username-validation-msg" value="{$user.username}">
                                <label class="mdc-floating-label" for="username">Tên đăng nhập</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="username-validation-msg">Không thể thay đổi</p>
                            <div class="mdc-text-field mdc-text-field--fullwidth portal-text-field--fullwidth">
                                <input class="params mdc-text-field__input" id="password" type="password" aria-controls="password-validation-msg" value="">
                                <label class="mdc-floating-label" for="password">Mật khẩu</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="password-validation-msg">Nhập mật khẩu mới</p>
                        </div>
                        <div class="mdc-layout-grid__cell--span-12-desktop mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-4-phone" style="text-align: right;">
                            <button class="mdc-button mdc-dialog__footer__button mdc-dialog__footer__button--accept-custom" id="saveInfo" type="button">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

