<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trùm sỉ KB</title>
    <base href="/backend/auth/">
    <link rel="shortcut icon" href="/static/frontend/img/icons/favicon.ico" type="image/png" sizes="152x152">
    <!-- load fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Barlow:100,300,400,400i,500,700,900" rel="stylesheet">
    <!-- Portal Styles-->
    <link rel="stylesheet" href="/static/admin/css/classic-light_blue-pink.css">
    <!-- page specific CSS-->
    <style type="text/css">.portal-card--hero .portal-card__content {
            padding: 24px 48px;
        }
        .mdc-button--portal-login {
            background-color: rgba(0, 0, 0, 0.12) !important;
            /*color: rgba(0, 0, 0, 0.38) !important;*/
            color: var(--mdc-theme-text-disabled-on-light, rgba(0, 0, 0, 0.38)) !important;
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2), 0 0 0 0 rgba(0, 0, 0, 0.14), 0 0 0 0 rgba(0, 0, 0, 0.12) !important;
        }
        @media (max-width: 479px){
            .mdc-layout-grid__inner {
                align-items: stretch !important;
            }
        }
    </style>
</head>
<body class="mdc-typography">
<div class="portal-wrapper">
    <main class="portal-main">
        <div class="portal-main__content mdc-theme--text-primary-on-light mdc-theme--secondary-bg-gradient portal-no-layout-container">
            <div class="mdc-layout-grid mdc-layout-grid--fullheight">
                <div class="mdc-layout-grid__inner">
                    <div class="mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet mdc-layout-grid__cell--span-4-phone"></div>
                    <div class="mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-6-tablet mdc-layout-grid__cell--span-4-phone">
                        <div class="mdc-card portal-card portal-card--hero portal-card--horizontal mdc-elevation--z12">
                            <div class="mdc-layout-grid mdc-layout-grid--fullheight">
                                <div class="mdc-layout-grid__inner">
                                    <div class="mdc-layout-grid__cell--span-12">
                                        <div class="portal-card__content portal-card__content--column" style="padding-bottom:0;">
                                            <section class="portal-text-center">
                                                <div class="portal-card__title portal-card__title--vertical">
                                                    <img class="portal-card__logo" src="/static/admin/images/logo/portal-logo.png" alt="logo">
                                                    <h1 class="portal-card--headline">Login</h1>
                                                </div>
                                            </section>
                                            <section class="portal-text-center">
                                                <div class="portal-card__title portal-card__title--vertical">
                                                    <form id="auth" style="width: 100%;" method="post" action="/admin/users/login">
                                                        <div class="mdc-text-field portal-text-field--fullwidth mdc-text-field--fullwidth mdc-text-field--dense">
                                                            <input class="form-control" type="hidden" placeholder="Page" name="r" value="{$r}">
                                                            <input class="form-control" type="hidden" placeholder="Language" name="language" value="vi">
                                                            <input class="mdc-text-field__input" id="username" type="text" name="username">
                                                            <label class="mdc-floating-label" for="username">Email Address</label>
                                                            <div class="mdc-line-ripple"></div>
                                                        </div>
                                                        <div class="mdc-text-field portal-text-field--fullwidth mdc-text-field--fullwidth mdc-text-field--dense">
                                                            <input class="mdc-text-field__input" id="password" type="password" autocomplete="current-password" name="password">
                                                            <label class="mdc-floating-label" for="password">Password</label>
                                                            <div class="mdc-line-ripple"></div>
                                                        </div>
                                                    </form>
                                                    <div class="portal-card__content--column-actions">
                                                        <button class="mdc-button mdc-button--raised mdc-button--portal-login" onclick="performLogin();">Login</button>
                                                        <a class="mdc-button mdc-button--portal-forgot-pwd" href="#forgot-password.html">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<!-- initialise material components js-->
<script src="/static/admin/js/plugins/material-components-web.js"></script>
<script>mdc.autoInit()</script><!-- page specific JS--><script>(function () {
        const tfRoot = document.querySelectorAll('.mdc-text-field');
        for (let i = 0; i < tfRoot.length; i++) {
            new mdc.textField.MDCTextField(tfRoot[i]);
            document.getElementById("username").addEventListener("keyup", function (event) {
                event.preventDefault();
                if (event.key === "Enter") {
                    performLogin();
                }
            });
            document.getElementById("password").addEventListener("keyup", function (event) {
                event.preventDefault();
                if (event.key === "Enter") {
                    performLogin();
                }
            });
        }
    })();
    function performLogin(){
        document.getElementById("auth").submit();
    }
</script>
</body>
</html>