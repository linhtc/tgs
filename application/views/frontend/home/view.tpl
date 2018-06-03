{if $style->style eq 'shop'}
    <div class="row">
        <div class="col-lg-12">
            <div class="white-block block-pad log-in">
                <h1>{$style->title}</h1>
            </div>
        </div>
    </div>
{/if}

{if !empty($pages)}
    {foreach from=$pages key=i item=page}
        <section id="section-{$page->section}" {if $style->style eq 'shop' and $i gte 2}style="background:#ffffff;padding:{if $i eq 2}40px{else}0{/if} 10px 0 10px;"{/if}>
            {if $page->title neq '' and $page->kind neq 'photo' and $page->kind neq 'list_2' and $page->kind neq 'list_3'}
                <div class="vc_row row">
                    <div class="wpb_column vc_column_container vc_col-sm-12">
                        <div class="vc_column-inner vc_custom_1489660256079">
                            <div class="wpb_wrapper">
                                <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text">
                                    <span class="vc_sep_holder vc_sep_holder_l">
                                        <span  class="vc_sep_line"></span>
                                    </span>
                                    <h4>
                                        {$page->title}
                                        <span>{$page->des}</span>
                                    </h4>
                                    <span class="vc_sep_holder vc_sep_holder_r">
                                        <span class="vc_sep_line"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $page->kind eq 'slide'}
                <div class="vc_row row">
                    <div class="wpb_column vc_column_container vc_col-sm-12">
                        <div class="vc_column-inner vc_custom_1489663406393">
                            <div class="wpb_wrapper">
                                <div class="vc_row wpb_row vc_inner vc_row-fluid">
                                    <div class="wpb_column vc_column_container vc_col-sm-12">
                                        <div class="vc_column-inner vc_custom_1525686869346">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <div tabindex="0" class="cycloneslider cycloneslider-template-dark cycloneslider-width-full" id="cycloneslider-home-1" >
                                                            <div class="cycloneslider-slides cycle-slideshow" data-cycle-allow-wrap="true" data-cycle-dynamic-height="off" data-cycle-auto-height="1000:300" data-cycle-auto-height-easing="null" data-cycle-auto-height-speed="250" data-cycle-delay="0" data-cycle-easing="" data-cycle-fx="fade" data-cycle-hide-non-active="true" data-cycle-log="false" data-cycle-next="#cycloneslider-home-1 .cycloneslider-next" data-cycle-pager="#cycloneslider-home-1 .cycloneslider-pager" data-cycle-pause-on-hover="true" data-cycle-prev="#cycloneslider-home-1 .cycloneslider-prev" data-cycle-slides="&gt; div" data-cycle-speed="1000" data-cycle-swipe="1" data-cycle-tile-count="7" data-cycle-tile-delay="100" data-cycle-tile-vertical="true" data-cycle-timeout="10000" >
                                                                {if !empty($metadata[$page->section])}
                                                                    {foreach from=$metadata[$page->section] key=index item=item}
                                                                        <div class="cycloneslider-slide cycloneslider-slide-image" >
                                                                            <img src="{$item->photo}" alt="" title="" />
                                                                            {if $item->title neq ''}
                                                                                <div class="cycloneslider-caption">
                                                                                    <div class="cycloneslider-caption-title">{$item->title}</div>
                                                                                    <div class="cycloneslider-caption-description">{$item->des}</div>
                                                                                    <a class="cycloneslider-caption-more" href="{$item->detail}">Đọc Tiếp</a>
                                                                                </div>
                                                                            {/if}
                                                                        </div>
                                                                    {/foreach}
                                                                {/if}
                                                            </div>
                                                            <div class="cycloneslider-pager"></div>
                                                            <a href="#" class="cycloneslider-prev">
                                                                <span class="arrow"></span>
                                                            </a>
                                                            <a href="#" class="cycloneslider-next">
                                                                <span class="arrow"></span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $page->kind eq 'option'}
                <div class="vc_row row">
                    {if !empty($metadata[$page->section])}
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-3">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <style>
                                            #el_152764133018506_{$index} .title,
                                            #el_152764133018506_{$index} .line-bottom {
                                                color: #000000;
                                            }
                                            #el_152764133018506_{$index} .dividerx {
                                                border-bottom-color: #000000;
                                            }
                                        </style>
                                        <div class="lab_wpb_banner_2 wpb_content_element banner-type-3" id="el_152764133018506_{$index}">
                                            <a href="{$item->detail}" target="_self">
                                                <img class="banner-img " src="{$item->photo}" width="400" height="280" alt="{$item->title}" title="{$item->title}" />
                                                <span class="ol" style="background-color: rgba(255,255,255,0.01);"></span>
                                                <span class="centered">
                                                    <span class="title wow bounce" data-wow-delay="450ms">
                                                        <strong>{$item->title} {$page->section}</strong>
                                                    </span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                </div>
            {/if}
            {if $page->kind eq 'photo'}
                <div class="vc_row row">
                    <div class="wpb_column vc_column_container vc_col-sm-12">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text">
                                <span class="vc_sep_holder vc_sep_holder_l">
                                    <span  class="vc_sep_line"></span>
                                </span>
                                    <h4>
                                        {$page->title}
                                        <span>{$page->des}</span>
                                    </h4>
                                    <span class="vc_sep_holder vc_sep_holder_r">
                                    <span  class="vc_sep_line"></span>
                                </span>
                                </div>
                                <div class="wpb_text_column wpb_content_element ">
                                    <div class="wpb_wrapper">
                                        <style type="text/css">
                                            .asg-filters div a {
                                                color: #ffffff;
                                                background-color: #222222;
                                            }
                                            .asg-filters div.active a {
                                                color: #ffffff;
                                                background-color: #444444;
                                            }
                                            .asg-image-overlay {
                                                background-color: #000;
                                                background-color: rgba(0, 0, 0, 0.3);
                                                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
                                                filter: alpha(opacity=30);
                                            }
                                            .asg-image-caption-wrapper {
                                                text-align: center;
                                                background-color: #000;
                                                background-color: rgba(0, 0, 0, 0.8);
                                                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
                                                filter: alpha(opacity=80);
                                            }
                                            .asg-image:hover .asg-image-caption-wrapper {
                                                opacity: 1;
                                            }
                                            .asg-image-caption1,
                                            .asg-image-caption1 a{
                                                color: #ffffff;
                                            }
                                            .asg-image-caption2,
                                            .asg-image-caption2 a{
                                                color: #ffffff;
                                            }
                                            .asg-bottom .asg-load-more{
                                                background-color: #000;
                                                color: #ffffff;
                                                box-shadow: 1.5px 3px 0 0 #eee;
                                            }
                                            .asg-bottom .asg-all-loaded {
                                                border-radius: 0;
                                                -webkit-border-radius: 0;
                                                -moz-border-radius: 0;
                                                -ms-border-radius: 0;
                                                -o-border-radius: 0;
                                            }
                                            .asg-bottom .asg-all-loaded {
                                                background-color: #888888;
                                                color: #cccccc;
                                            }
                                            .asg-bottom .asg-all-loaded {
                                                border-bottom-color: #bbbbbb;
                                            }
                                            .asg-bottom > div {
                                                -webkit-border-radius: 0px;
                                                -moz-border-radius: 0px;
                                                -ms-border-radius: 0px;
                                                -o-border-radius: 0px;
                                                border-radius: 0px;

                                                padding: 12px 30px;
                                            }
                                            .asg-image-caption1 {
                                                font-size: 14px;
                                                line-height: 1.4;
                                            }
                                            .asg-image-caption2 {
                                                font-size: 14px;
                                                line-height: 1.4;
                                            }
                                        </style>
                                        <div class="asg-wrapper" id="asg-wrapper-{$page->kind}-{$page->section}"></div>
                                        <script>
                                            let id = 'asg-wrapper-{$page->kind}-{$page->section}';
                                            let el = document.getElementById(id);
                                            let options = {
                                                "id": "{$page->kind}",
                                                "scriptUrl": "/static/frontend/js/awesome-gallery.js",
                                                "gallerySlug": "{$page->kind}-hang-co-san",
                                                "rand":1,
                                                "layout":{
                                                    "mode":"usual",
                                                    "width":240,
                                                    "height":260,
                                                    "gap":5,
                                                    "border":0,
                                                    "allowHanging":false
                                                },
                                                "image":{
                                                    "blur":"off",
                                                    "bw":"off"
                                                },
                                                "caption":{
                                                    "mode":"on-hover",
                                                    "color":"#FFFFFF",
                                                    "color2":"#FFFFFF",
                                                    "background_color":"#000",
                                                    "opacity":"0.8",
                                                    "effect":"fade",
                                                    "align":"center",
                                                    "position":"bottom",
                                                    "font1":{
                                                        "family":"",
                                                        "style":"",
                                                        "size":"14"
                                                    },
                                                    "font2":{
                                                        "family":"",
                                                        "style":"",
                                                        "size":"14"
                                                    }
                                                },
                                                "overlay":{
                                                    "mode":"on-hover",
                                                    "color":"#000",
                                                    "opacity":"0.3",
                                                    "effect":"fade",
                                                    "image":""
                                                },
                                                "filters":{
                                                    "enabled":"",
                                                    "align":"center",
                                                    "sort":"1",
                                                    "style":"tabs",
                                                    "all":"All",
                                                    "color":"#FFFFFF",
                                                    "background_color":"#222222",
                                                    "accent_color":"#FFFFFF",
                                                    "accent_background_color":"#444444",
                                                    "border_radius":"0",
                                                    "list":[

                                                    ],
                                                    "active":"_"
                                                },
                                                "loadMore":{
                                                    "style":"load-more",
                                                    "page_size":"48",
                                                    "loading_text":"Loading...",
                                                    "load_more_text":"XEM TH\u00caM",
                                                    "all_images_loaded":"All images loaded",
                                                    "width":"full",
                                                    "color":"#FFFFFF",
                                                    "color_loaded":"#CCCCCC",
                                                    "background_color":"#000",
                                                    "background_color_loaded":"#888888",
                                                    "shadow_width":"3",
                                                    "shadow_color":"#EEE",
                                                    "shadow_color_loaded":"#BBBBBB",
                                                    "border_radius":"0",
                                                    "vertical_padding":"12",
                                                    "horizontal_padding":"30"
                                                },
                                                "images": {if !empty($metadata[$page->section])} {$metadata[$page->section]} {else} [] {/if}
                                            };
                                            function isVisible() {
                                                return el.offsetWidth !== 0 || el.offsetHeight !== 0;
                                            }
                                            function runWhen(condition, callback) {
                                                function run() {
                                                    if (condition()) {
                                                        callback();
                                                    } else {
                                                        setTimeout(run, 500);
                                                    }
                                                }
                                                run();
                                            }
                                            function show() {
                                                window.awesomeGallery(el, options);
                                            }
                                            function ready(callback) {
                                                if (document.readyState === 'complete') {
                                                    setTimeout(callback, 0);
                                                } else {
                                                    document.addEventListener("DOMContentLoaded", callback);
                                                }
                                            }
                                            function loadScript(callback, url, id){
                                                let script = document.getElementById(id);
                                                if (!script) {
                                                    script = document.createElement('SCRIPT');
                                                    script.setAttribute('src', url);
                                                    script.id = id;
                                                    script.addEventListener('load', callback);
                                                    document.documentElement.appendChild(script)
                                                } else {
                                                    script.addEventListener('load', callback);
                                                }
                                            }
                                            function run() { runWhen(isVisible, show);
                                            }
                                            ready(function(){
                                                if (window.awesomeGallery) {
                                                    run();
                                                } else {
                                                    loadScript(run, options.scriptUrl, 'awesome-gallery-script');
                                                }
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $page->kind eq 'article'}
                {if !empty($metadata[$page->section])}
                    {foreach from=$metadata[$page->section] key=index item=item}
                        <div class="vc_row row">
                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="lab_wpb_banner wpb_content_element banner  banner-white text-button-center">
                                            <div class="button_outer">
                                                <div class="button_middle">
                                                    <div class="button_inner">
                                                        <div class="banner-content">
                                                            <h1><strong>{$item->title}</strong></h1>
                                                            <span>{$item->des}</span>
                                                        </div>
                                                        {if $item->detail neq ''}
                                                            <div class="banner-call-button">
                                                                <a href="{$item->detail}" class="btn" target="">
                                                                    XEM THÊM!
                                                                </a>
                                                            </div>
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'contact'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_custom_1521533964140 vc_row-has-fill vc_row-o-content-middle vc_row-flex">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-4">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="wpb_single_image wpb_content_element vc_align_left">
                                            <figure class="wpb_wrapper vc_figure">
                                                <a href="{$item->detail}" title="{$item->title}" target="_blank" class="vc_single_image-wrapper vc_box_border_grey">
                                                    <img width="463" height="158" src="{$item->photo}" class="vc_single_image-img attachment-full" alt="{$item->title}" />
                                                </a>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="vc_empty_space" style="height: 50px"><span class="vc_empty_space_inner"></span></div>
                {/if}
            {/if}
            {if $page->kind eq 'list_1'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_custom_1487213667707 vc_row-has-fill vc_row-o-content-middle vc_row-flex">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-6">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="vc_row wpb_row vc_inner vc_row-fluid">
                                            <div class="wpb_column vc_column_container vc_col-sm-3">
                                                <div class="vc_column-inner ">
                                                    <div class="wpb_wrapper">
                                                        <div class="wpb_single_image wpb_content_element vc_align_center">
                                                            <figure class="wpb_wrapper vc_figure">
                                                                <div class="vc_single_image-wrapper vc_box_border_grey">
                                                                    <img width="128" height="128" src="{$item->photo}" alt="{$item->title}" />
                                                                </div>
                                                            </figure>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="wpb_column vc_column_container vc_col-sm-9">
                                                <div class="vc_column-inner ">
                                                    <div class="wpb_wrapper">
                                                        <div class="wpb_text_column wpb_content_element ">
                                                            <div class="wpb_wrapper">
                                                                <p><strong>{$item->title}</strong></p>
                                                                <p>{$item->des}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'list_2'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text">
                                        <span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span>
                                        <h4>
                                            {$page->title}
                                            <span>{$page->des}</span>
                                        </h4>
                                        <span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span>
                                    </div>
                                    <div class="wpb_text_column wpb_content_element  vc_custom_1509912445903">
                                        <div class="wpb_wrapper">
                                            <div style="font-family: Arial, Verdana, Helvetica, sans-serif; line-height: 20.7999992370605px;">
                                                <div style="line-height: 20.7999992370605px;">
                                                    <div style="padding: 10px; text-align: justify; border: 6px dotted #ee7d15; border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; border-radius: 4px; outline: 0px; vertical-align: baseline; line-height: 21px; font-family: Tahoma, Geneva, sans-serif; background-repeat: no-repeat;">
                                                        {foreach from=$metadata[$page->section] key=index item=item}
                                                            <p style="color: #000000; font-family: Arial; font-size: 15px; line-height: 20.7999992370605px;">
                                                                <span style="font-size: 18px; font-family: arial, helvetica, sans-serif;"><img class=" lazyloaded" style="line-height: 18px; margin: 0px; padding: 0px; max-width: 100%; border: 0px; outline: 0px; vertical-align: baseline; width: 60px; height: 20px; background: transparent;" src="/static/frontend/images/mui-ten.gif" alt="" data-lazy-src="/static/frontend/images/mui-ten.gif" data-pagespeed-url-hash="1743886238">
                                                                    {$item->title}
                                                                </span>
                                                            </p>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                                <div style="margin: 0px auto; padding: 0px; color: #444444; font-family: Arial, Verdana, Helvetica, sans-serif; line-height: 26px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="vc_empty_space" style="height: 50px"><span class="vc_empty_space_inner"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'text'}
                {if !empty($metadata[$page->section])}
                    {foreach from=$metadata[$page->section] key=index item=item}
                        <div class="term-description">
                            {$item->des}
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'box'}
                {if !empty($metadata[$page->section])}
                    {foreach from=$metadata[$page->section] key=index item=item}
                        <div class="vc_row row">
                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="lab_wpb_banner wpb_content_element banner  banner-white">
                                            <div class="button_outer">
                                                <div class="button_middle">
                                                    <div class="button_inner">
                                                        <div class="banner-content">
                                                            <strong>
                                                                <p></p>
                                                                <h2>{$item->title}</h2>
                                                            </strong>
                                                            <p>
                                                                <strong></strong>
                                                                <span>{$item->des}</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'option_4'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-6">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <style>
                                            #el_152785966982702_{$index} .title,
                                            #el_152785966982702_{$index} .line-bottom {
                                                color: #000000;
                                            }
                                            #el_152785966982702_{$index} .dividerx {
                                                border-bottom-color: #000000;
                                            }
                                        </style>
                                        <div class="lab_wpb_banner_2 wpb_content_element banner-type-3" id="el_152785966982702_{$index}">
                                            <a href="{$item->detail}" target="_self">
                                                <img class="banner-img " src="{$item->photo}" width="400" height="280" alt="{$item->title}" title="{$item->title}">
                                                <span class="ol" style="background-color: rgba(255,255,255,0.01);"></span>
                                                <span class="centered">
												<span class="title wow bounce animated" data-wow-delay="450ms" style="visibility: visible; animation-delay: 450ms; animation-name: bounce;">
                                                    <strong>{$item->title}</strong>
                                                </span>
                                            </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'product'}
                {if !empty($metadata[$page->section])}
                    <div class="row">
                        <div class="shop-grid">
                            <section class="items-env">
                                <div class="items">
                                    <div class="clear"></div>
                                    {foreach from=$metadata[$page->section] key=index item=item}
                                        <div class="col-sm-3 first post-{$item->id} product type-product status-publish has-post-thumbnail instock shipping-taxable purchasable product-type-simple">
                                            <div class="item-wrapper">
                                                <div class="item">
                                                    <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                                    </a>
                                                    <div class="image full-gallery">
                                                        <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                                        </a>
                                                        <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="thumb">
                                                            <img width="520" height="625" src="{$item->photo}" class="attachment-shop-thumb-1 size-shop-thumb-1" alt=""> </a>
                                                    </div>
                                                    <div class="white-block description">
                                                        <h4 class="title">
                                                            <a href="/san-pham/{friendly_url($item->title)}-{$item->id}">{$item->title}</a>
                                                        </h4>
                                                        <span class="type">
                                                            <a href="#" rel="tag">{$style->title}</a>
                                                        </span>
                                                        <div class="divider"></div>
                                                        <span class="price" style="width: 100%;">GIÁ SỈ:
                                                            <span class="woocommerce-Price-amount amount">
                                                                {$item->des}
                                                                <span class="woocommerce-Price-currencySymbol">₫</span>
                                                            </span>
                                                        </span>
                                                        <span class="price2" style="color: #dd1f26;font-size: 22px;"></span>
                                                        <!--<a class="add-to-cart-btn add-to-cart glyphicon glyphicon-shopping-cart" data-id="{$item->id}" data-toggle="tooltip" data-placement="bottom" title="" href="#" data-original-title="Thêm vào giỏ">
                                                            <span class="glyphicon glyphicon-ok-sign"></span>
                                                        </a>-->
                                                        <a class="add-to-cart-btn glyphicon glyphicon-shopping-cart" data-id="{$item->id}" data-toggle="tooltip" data-placement="bottom" title="" href="javascript:void(0);" data-original-title="Thêm vào giỏ">
                                                            <span class="glyphicon glyphicon-ok-sign"></span>
                                                        </a>
                                                        <div class="error-container"></div>
                                                    </div>
                                                    <div class="loading-disabled">
                                                        <div class="loader">
                                                            <strong>Thêm vào giỏ</strong>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <div class="clear"></div>
                                </div>
                            </section>
                        </div>
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'ref'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_row-has-fill">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner">
                                <div class="wpb_wrapper">
                                    <div class="wpb_single_image wpb_content_element vc_align_center">
                                    {foreach from=$metadata[$page->section] key=index item=item}
                                        <div class="wpb_single_image wpb_content_element vc_align_center">
                                            <figure class="wpb_wrapper vc_figure">
                                        {if $item->detail eq ''}
                                            <div class="vc_single_image-wrapper vc_box_border_grey">
                                                <img src="{$item->photo}" class="vc_single_image-img attachment-full" alt="{$item->title}">
                                            </div>
                                        {else}
                                            <a href="{$item->detail}" target="_blank" class="vc_single_image-wrapper vc_box_border_grey">
                                                <img src="{$item->photo}" class="vc_single_image-img attachment-full" alt="{$item->title}">
                                            </a>
                                        {/if}
                                            </figure>
                                        </div>
                                    {/foreach}
                                    <!--<div class="wpb_text_column wpb_content_element ">
                                        <div class="wpb_wrapper">
                                            <div class="fb-like fb_iframe_widget" data-href="https://facebook.com/trumgiasishop/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="false" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=616754451826546&amp;container_width=1255&amp;href=https%3A%2F%2Ffacebook.com%2Ftrumgiasishop%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=false&amp;show_faces=true&amp;size=small"><span style="vertical-align: bottom; width: 81px; height: 20px;"><iframe name="f1ee07536d34f38" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:like Facebook Social Plugin" src="https://www.facebook.com/v2.3/plugins/like.php?action=like&amp;app_id=616754451826546&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FoVjM2wVZ10b.js%3Fversion%3D42%23cb%3Df2172fe409e35d4%26domain%3Dtrumgiasi.com%26origin%3Dhttps%253A%252F%252Ftrumgiasi.com%252Ff254ebf3c2c8964%26relation%3Dparent.parent&amp;container_width=1255&amp;href=https%3A%2F%2Ffacebook.com%2Ftrumgiasishop%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=false&amp;show_faces=true&amp;size=small" style="border: none; visibility: visible; width: 81px; height: 20px;" class=""></iframe></span></div>
                                            <div class="fb-share-button fb_iframe_widget" data-href="https://trumgiasi.com/shop/vay-dam-quang-chau/" data-layout="button_count" data-size="small" data-mobile-iframe="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=616754451826546&amp;container_width=1255&amp;href=https%3A%2F%2Ftrumgiasi.com%2Fshop%2Fvay-dam-quang-chau%2F&amp;layout=button_count&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=small"><span style="vertical-align: bottom; width: 78px; height: 20px;"><iframe name="f27151e691df1e" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:share_button Facebook Social Plugin" src="https://www.facebook.com/v2.3/plugins/share_button.php?app_id=616754451826546&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FoVjM2wVZ10b.js%3Fversion%3D42%23cb%3Df12df40d2cbbda%26domain%3Dtrumgiasi.com%26origin%3Dhttps%253A%252F%252Ftrumgiasi.com%252Ff254ebf3c2c8964%26relation%3Dparent.parent&amp;container_width=1255&amp;href=https%3A%2F%2Ftrumgiasi.com%2Fshop%2Fvay-dam-quang-chau%2F&amp;layout=button_count&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=small" style="border: none; visibility: visible; width: 78px; height: 20px;" class=""></iframe></span></div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'list_3'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_custom_1508071268070 vc_row-has-fill">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="wpb_text_column wpb_content_element" style="padding-left:10%;padding-right:10%;">
                                        <div class="wpb_wrapper">
                                            <p><strong>{$page->title}</strong></p>
                                            <ul>
                                            {foreach from=$metadata[$page->section] key=index item=item}
                                                <li>{$item->title}</li>
                                            {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'video'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_custom_1508071268070 vc_row-has-fill">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner">
                                <div class="wpb_wrapper">
                                    <div class="wpb_text_column wpb_content_element" style="padding-left:10%;padding-right:10%;">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_video_widget wpb_content_element vc_clearfix vc_video-aspect-ratio-169 vc_video-el-width-100 vc_video-align-center">
                                                <div class="wpb_wrapper">
                                                    <div class="wpb_video_wrapper">
                                                        {foreach from=$metadata[$page->section] key=index item=item}
                                                            {$item->detail}
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'free'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="lab_wpb_banner wpb_content_element banner banner-white text-button-center">
                                        {foreach from=$metadata[$page->section] key=index item=item}
                                            {$item->des}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
        </section>
    {/foreach}
{/if}

<!-- Facebook Comments Plugin for WordPress: http://peadig.com/wordpress-plugins/facebook-comments/ -->
<!--
<div class='fb-cmt'>
    <h3 class="facebook123">Bình Luật Trên Facebook</h3>
    <div class="fb-comments" data-href="https://trumgiasi.com/" data-numposts="5" data-width="100%" data-colorscheme="light"></div>
</div>
-->