<!DOCTYPE html>
<html lang="vi">
<head>
    {include file='backend/layouts/head.tpl'}
</head>
<body data-rsssl=1 class="home page-template-default page page-id-897 et_bloom oxygen-sidebar-menu ht-1 sticky-menu wpb-js-composer js-comp-ver-4.11.2 vc_responsive">
{include file='backend/layouts/cart.tpl'}
<div class="wrapper">
    {include file='backend/layouts/sidebar.tpl'}
    <div class="main">
        {include file='backend/layouts/breadcrumb.tpl'}
        {*{include file='frontend/layouts/chatbox.tpl'}*}
        <div class="{if $style->style eq 'shop'}laborator-woocommerce shop{else}page-container{/if}">
            {$content}
        </div>
    </div>
    {include file='backend/layouts/footer.tpl'}
</div>
{include file='backend/layouts/mobi.tpl'}
{include file='backend/layouts/snp.tpl'}
{include file='backend/layouts/extra.tpl'}
</body>
</html>