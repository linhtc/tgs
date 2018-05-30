<!-- Logo -->
<a href="#" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>STV</b></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>STV</b> Tool</span>
</a>

<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
    </a>

    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li>
                <a href="/admin/users/language/vi" title="Tiếng Việt" {if $smarty.session.lang_key eq 'vi'}style="text-decoration: underline; pointer-events: none; cursor: text;"{/if}>Vi</a>
            </li>
            <li>
                <a href="/admin/users/language/en" title="English" {if $smarty.session.lang_key eq 'en'}style="text-decoration: underline; pointer-events: none; cursor: text;"{/if}>En</a>
            </li>
            <li>
                <a href="/admin/profiles/logout" title="Logout"><i class="fa fa-sign-out"></i></a>
            </li>
        </ul>
    </div>

</nav>
