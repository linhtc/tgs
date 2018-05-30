<!DOCTYPE html>
<html lang="en">
<head>
    <base href="/">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- load fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Barlow:100,300,400,400i,500,700,900" rel="stylesheet">
    <!-- Portal Styles-->
    <link id="portal-stylesheet" rel="stylesheet" href="/static/admin/css/classic-light_blue-pink.css">
    <link id="custom-stylesheet" rel="stylesheet" href="/static/admin/css/custom.css">
    {$listCss}
    <!-- favicon-->
    <link rel="shortcut icon" href="/static/frontend/img/icons/favicon.ico" type="image/png" sizes="152x152">
    <title>{if !empty($title)} $title {else} Mectronic Admin {/if}</title>
</head>
<body class="mdc-typography pace-on">
<!-- Loader-->
<div class="portal-loader-logo-wrapper">
    <div class="portal-loader-logo">
        <div class="portal-loader-logo__circle portal-loader-logo__circle__bottom"></div>
        <div class="portal-loader-logo__circle portal-loader-logo__circle__top"></div>
        <div class="portal-loader-logo__circle portal-loader-logo__circle__left"></div>
        <div class="portal-loader-logo__circle portal-loader-logo__circle__right"></div>
        <div class="portal-loader-logo__circle portal-loader-logo__circle__inner"></div>
    </div>
    <div class="portal-loader-logo-text">Portal</div>
</div>
<div class="portal-wrapper">
    <!-- Sidebar menu-->
    <div class="portal-wrapper__sidenav portal-wrapper__sidenav--classic mdc-theme--dark">
        <aside class="mdc-drawer mdc-drawer--persistent mdc-drawer--open mdc-drawer--portal-flex-content" id="left-drawer">
            <nav class="mdc-drawer__drawer" id="nav-drawer">
                <header class="mdc-toolbar mdc-theme--text-primary-on-primary-dark mdc-theme--primary-dark-bg mdc-toolbar--portal-no-shrink">
                    <div class="mdc-toolbar__row">
                        <section class="mdc-toolbar__section mdc-toolbar__section--align-start"><img class="mdc-toolbar__logo" src="/static/admin/images/logo/portal-logo.png" alt="Portal"><span class="mdc-toolbar__title">Portal</span></section>
                    </div>
                </header>
                <div class="mdc-list-group mdc-drawer__content portal-hide-scrollbars portal-navigation" id="portal-navigation">
                    <nav class="mdc-list portal-navigation-list">
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'home'}mdc-list-item--activated{/if}" href="/admin/homes">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">dashboard</i>
                                Trang chủ
                            </span>
                            <span class="portal-badge portal-badge--secondary">3</span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item  {if $page eq 'introduction'}mdc-list-item--activated{/if}" href="/admin/introductions">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">3d_rotation</i>
                                Giới thiệu
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item  {if $page eq 'design'}mdc-list-item--activated{/if}" href="/admin/designs">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">3d_rotation</i>
                                Thư viện ảnh
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item  {if $page eq 'design_pro'}mdc-list-item--activated{/if}" href="/admin/design-pro">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">3d_rotation</i>
                                TK Chuyên nghiệp
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item  {if $page eq 'customer'}mdc-list-item--activated{/if}" href="/admin/customers">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">3d_rotation</i>
                                Khách hàng
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item  {if $page eq 'comment'}mdc-list-item--activated{/if}" href="/admin/comments">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">3d_rotation</i>
                                Phản hồi
                            </span>
                        </a>
                        {*<a class="portal-navigation-list__item mdc-list-item {if $page eq 'technology'}mdc-list-item--activated{/if}" href="#">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">fingerprint</i>
                                Công nghệ
                            </span>
                        </a>*}
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'career'}mdc-list-item--activated{/if}" href="/admin/careers">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">supervisor_account</i>
                                Tuyển dụng
                            </span>
                        </a>
                        {*<a class="portal-navigation-list__item mdc-list-item {if $page eq 'contact'}mdc-list-item--activated{/if}" href="#">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">explore</i>
                                Liên hệ
                            </span>
                        </a>*}
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'list'}mdc-list-item--activated{/if}" href="/admin/lists">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">list</i>
                                Liệt kê
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'notification'}mdc-list-item--activated{/if}" href="/admin/notifications">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">notifications</i>
                                Lời nhắn
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'configuration'}mdc-list-item--activated{/if}" href="/admin/configurations">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">pets</i>
                                Cấu hình
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'language'}mdc-list-item--activated{/if}" href="/admin/languages">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">language</i>
                                Ngôn ngữ
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'profile'}mdc-list-item--activated{/if}" href="/admin/profile">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">person</i>
                                Cá nhân
                            </span>
                        </a>
                        <a class="portal-navigation-list__item mdc-list-item {if $page eq 'logout'}mdc-list-item--activated{/if}" href="/admin/profile/logout">
                            <span class="portal-navigation-list__text">
                                <i class="material-icons mdc-list-item__graphic portal-navigation-list__icon" aria-hidden="true">call_received</i>
                                Đăng xuất
                            </span>
                        </a>
                    </nav>
                </div>
                <footer class="mdc-toolbar mdc-theme--text-primary-on-primary-dark mdc-theme--primary-dark-bg mdc-toolbar--portal-no-shrink">
                    <div class="mdc-toolbar__row">
                        <section class="mdc-toolbar__section mdc-toolbar__section--align-end"><a class="material-icons mdc-toolbar__menu-icon" id="portal-sidemenu-close-icon" href="#"><span class="portal-navigation-list__text portal-sidenav-collapse-icon">chevron_left</span></a></section>
                    </div>
                </footer>
            </nav>
        </aside>
    </div>
    <!-- Main-->
    <main class="portal-main">
        <!-- Header-->
        <header class="mdc-toolbar mdc-theme--text-primary-on-primary-light mdc-theme--primary-light-bg mdc-toolbar--portal-no-shrink portal-toolbar">
            <div class="mdc-toolbar__row">
                <section class="mdc-toolbar__section mdc-toolbar__section--align-start"><a class="portal-burger-menu-icon--classic material-icons mdc-toolbar__menu-icon" id="portal-top-toolbar-burger-icon" href="#">menu</a><span class="mdc-toolbar__title">Portal</span></section>
                <section class="mdc-toolbar__section mdc-toolbar__section--align-end">
                    <div class="material-icons mdc-toolbar__icon mdc-menu-anchor" id="portal-layout-menu-button" aria-label="Notifications">
                        apps
                        <div class="mdc-menu" id="portal-layout-menu" tabindex="-1">
                            <div class="mdc-menu__items mdc-list" role="menu" aria-hidden="true">
                                <a class="mdc-list-item" href="/admin/profiles/view" role="menuitem" tabindex="0">Profile</a>
                                <a class="mdc-list-item" href="/admin/users/logout" role="menuitem" tabindex="0">Logout</a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </header>
        <!-- Content-->
        <div class="portal-main__content mdc-theme--background mdc-theme--text-primary-on-background">
            {$content}
        </div>
        <!-- Footer-->
        <footer class="portal-footer mdc-toolbar mdc-theme--text-primary-on-primary-light mdc-theme--primary-light-bg mdc-toolbar--portal-no-shrink">
            <div class="mdc-toolbar__row">
                <section class="mdc-toolbar__section mdc-toolbar__section--align-start">
                    <div class="mdc-toolbar__title"><small>© 2018 Agikigi Corp.</small></div>
                </section>
                <section class="mdc-toolbar__section mdc-toolbar__section--align-end"><a class="mdc-toolbar__icon mdc-theme--secondary" href="#"><small><i class="fa fa-twitter"></i></small></a><a class="mdc-toolbar__icon mdc-theme--secondary" href="#"><small><i class="fa fa-facebook"></i></small></a><a class="mdc-toolbar__icon mdc-theme--secondary" href="#"><small><i class="fa fa-linkedin"></i></small></a></section>
            </div>
        </footer>
    </main>
</div>
<script src="/static/admin/js/jquery-3.2.1.min.js"></script>
<!-- initialise material components js-->
<script src="/static/admin/js/plugins/material-components-web.js"></script>
<!-- layout js-->
<script src="/static/admin/js/plugins/classic.js"></script>
<!-- components js-->
{*<script src="/static/admin/js/plugins/notification-sidenav.js"></script>*}
<script type="text/javascript" src="/static/admin/js/plugins/top-toolbar.js"></script>
<script type="text/javascript" src="/static/admin/js/plugins/pace.js"></script>
<script type="text/javascript" src="/static/admin/js/plugins/notify.js"></script>
<script type="text/javascript" src="/static/admin/js/plugins/sweet.alert.min.js"></script>
{$listJs}
<script>
    mdc.autoInit();
    // an scrollbar cho trinh duyet firefox do khong dung css trick duoc
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        var element = document.getElementById('portal-navigation');
        var scrollBarWidth = element.offsetWidth - element.clientWidth;
        element.style.marginRight = (scrollBarWidth*-1)+'px';
        var siderbar = document.getElementById('nav-drawer');
        siderbar.style.overflowX = 'hidden';
    }
</script>
</body>
</html>