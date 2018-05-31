<!DOCTYPE html>
<html lang="vi">
<head>
    {include file='frontend/layouts/head.tpl'}
</head>
<body data-rsssl=1 class="home page-template-default page page-id-897 et_bloom oxygen-sidebar-menu ht-1 sticky-menu wpb-js-composer js-comp-ver-4.11.2 vc_responsive">
{include file='frontend/layouts/cart.tpl'}
<div class="wrapper">
    {include file='frontend/layouts/sidebar.tpl'}
    <div class="main">
        {include file='frontend/layouts/breadcrumb.tpl'}
        {include file='frontend/layouts/chatbox.tpl'}
        <div class="page-container">
            {$content}
        </div>
    </div>
    {include file='frontend/layouts/footer.tpl'}
</div>
{include file='frontend/layouts/mobi.tpl'}
{include file='frontend/layouts/snp.tpl'}
{include file='frontend/layouts/extra.tpl'}
</body>
</html>