<!DOCTYPE html>

<!--

╔═══╦═══╦═══╦╗──╔╗
║╔══╣╔═╗║╔═╗║║─╔╝╚╗
║╚══╣║║║║║║║║╚═╬╗╔╬══╗╔══╦══╦╗╔╗
╚══╗║║║║║║║║║╔╗╠╣║║══╣║╔═╣╔╗║╚╝║
╔══╝║╚═╝║╚═╝║╚╝║║╚╬══╠╣╚═╣╚╝║║║║
╚═══╩═══╩═══╩══╩╩═╩══╩╩══╩══╩╩╩╝

http://agikigi.com

Hello you! We're VAS of Mobiistar Corp.

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>CNC Precision</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>


        <meta name="googlebot" content="noindex" />

        <!-- Bootstrap 3.3.7 -->
        <link href="{base_url()}static/default/template/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="{base_url()}static/default/template/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />

        <!-- Font Awesome Icons -->
        <link href="{base_url()}static/default/template/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />



        <!-- Select 2 -->
        <link href="{base_url()}static/default/template/select2/css/select2.min.css" rel="stylesheet" type="text/css" />


        <!-- Theme style -->
        <link href="{base_url()}static/admin/template/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
        <link href="{base_url()}static/admin/template/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

        <link rel="shortcut icon" type="image/x-icon" href="http://muahang.mobiistar.vn/image/data/Banner/favicon.png">

        <!-- jQuery 2.2.4 -->
        <script src="{base_url()}static/default/template/main/js/jquery.min.js"></script>

        <!-- Bootstrap 3.3.7 JS -->
        <script src="{base_url()}static/default/template/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        {$listCss}

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .sidebar-collapse .li-level1 a{
                color: transparent !important;
            }
            .sidebar-collapse .li-level1 a i{
                color: #b8c7ce;
            }
            .sidebar-collapse .user-panel {
                padding-left: 3px;
            }
            .sidebar-collapse .sidebar-menu>li:hover>a, .skin-blue .sidebar-menu>li.active>a>i{
                color: #fff;
            }
            .bs-searchbox .form-control {
                border: none;
                border-bottom: thin solid silver;
            }
            .filter-data .filter-option {
                font-weight: 900;
                color: gray;
            }
            @media (max-width: 767px){
                .main-header .logo {
                    display: none;
                }
                .fixed .content-wrapper, .fixed .right-side {
                    padding-top: 50px !important;
                }
                .main-sidebar, .left-side {
                    padding-top: 50px!important;
                }
                .main-header .sidebar-toggle:before {
                    content: "Canvas Tool";
                }
                .main-header .sidebar-toggle {
                    font-family: 'Source Sans Pro','Helvetica Neue',Helvetica,Arial,sans-serif;
                    font-weight: 400;
                }
            }
        </style>
    </head>
    <body class="skin-blue fixed sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                {include file='admin/layouts/default_header.tpl'}
            </header>

            <aside class="main-sidebar">
                {include file='admin/layouts/default_sidebar.tpl'}
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                {$content}
            </div>

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> beta3
                </div>
                <strong>Copyright &copy; 2017 <a href="http://mobiistar.vn" target="_blank">Mobiistar</a>.</strong> All rights reserved.
            </footer>


        </div><!-- ./wrapper -->

        <!-- AdminLTE App -->
        <script src="{base_url()}static/admin/template/js/app.min.js" type="text/javascript"></script>

        <!-- SlimScroll 1.3.0 -->
        <script src="{base_url()}static/admin/template/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>

        <!-- Select 2 -->
        <script src="{base_url()}static/default/template/select2/js/select2.min.js" type="text/javascript"></script>

        <!-- AdminLTE for demo purposes -->
        <script src="{base_url()}static/admin/template/js/demo.js" type="text/javascript"></script>

        <script type="text/javascript">
            langRootDaysOfWeek = ["{lang('Sun')}", "{lang('Mon')}", "{lang('Tue')}", "{lang('Wed')}", "{lang('Thu')}", "{lang('Fri')}", "{lang('Sat')}"];
            langRootMonthNames = ["{lang('Jan')}", "{lang('Feb')}", "{lang('Mar')}", "{lang('Apr')}", "{lang('May')}", "{lang('Jun')}", "{lang('Jul')}", "{lang('Aug')}", "{lang('Sep')}", "{lang('Oct')}", "{lang('Nov')}", "{lang('Dec')}"];
            langRootOK = '{lang("ok")}';
            langRootCancel = '{lang("cancel")}';
            langRootFrom = '{lang("from")}';
            langRootTo = '{lang("to")}';
            langRootDateFormat = '{lang("MM-DD-YYYY")}';
            langRootNotify = '{lang('notify')}';
            langRootComplete = '{lang('complete')}';
            langRootError = '{lang('error')}';
            langRootAreYouSure = '{lang('are_u_sure')}';
            langRootOkButton = '{lang('ok')}';
            langRootCancelButton = '{lang('cancel')}';
        </script>

        {$listJs}


        <!-- Main -->
        <script src="{base_url()}static/admin/js/main.js" type="text/javascript"></script>

        <script src="{base_url()}static/default/template/main/js/google.js"></script>

        <script src="{base_url()}static/admin/js/scrolltop.js"></script>

    </body>
</html>