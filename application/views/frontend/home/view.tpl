{if !empty($pages)}
    {foreach from=$pages key=i item=page}
        <section id="section-{$page->section}">
            {if $page->title neq '' and $page->kind neq 'photo'}
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
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-filters div a {
                                                color: #ffffff;
                                                background-color: #222222;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-filters div.active a {
                                                color: #ffffff;
                                                background-color: #444444;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-overlay {
                                                background-color: #000;
                                                background-color: rgba(0, 0, 0, 0.3);
                                                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
                                                filter: alpha(opacity=30);
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption-wrapper {
                                                text-align: center;
                                                background-color: #000;
                                                background-color: rgba(0, 0, 0, 0.8);
                                                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
                                                filter: alpha(opacity=80);
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image:hover .asg-image-caption-wrapper {
                                                opacity: 1;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption1,
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption1 a{
                                                color: #ffffff;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption2,
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption2 a{
                                                color: #ffffff;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-bottom .asg-load-more{
                                                background-color: #000;
                                                color: #ffffff;
                                                box-shadow: 1.5px 3px 0 0 #eee;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-bottom .asg-all-loaded {
                                                border-radius: 0;
                                                -webkit-border-radius: 0;
                                                -moz-border-radius: 0;
                                                -ms-border-radius: 0;
                                                -o-border-radius: 0;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-bottom .asg-all-loaded {
                                                background-color: #888888;
                                                color: #cccccc;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-bottom .asg-all-loaded {
                                                border-bottom-color: #bbbbbb;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-bottom > div {
                                                -webkit-border-radius: 0px;
                                                -moz-border-radius: 0px;
                                                -ms-border-radius: 0px;
                                                -o-border-radius: 0px;
                                                border-radius: 0px;

                                                padding: 12px 30px;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption1 {
                                                font-size: 14px;
                                                line-height: 1.4;
                                            }
                                            #awesome-gallery-{$page->kind}-{$page->section} .asg-image-caption2 {
                                                font-size: 14px;
                                                line-height: 1.4;
                                            }
                                        </style>
                                        <div class="asg-wrapper" id="asg-wrapper-{$page->kind}-{$page->section}"></div>
                                        <script>
                                            let id = 'asg-wrapper-{$page->kind}-{$page->section}';
                                            let el = document.getElementById(id);
                                            let options = {
                                                "id": "{$page->kind}-{$page->section}",
                                                "scriptUrl": "/static/frontend/js/awesome-gallery.js",
                                                "gallerySlug": "{$page->kind}-hang-co-san",
                                                "rand": 1,
                                                "layout": {
                                                    "mode": "usual",
                                                    "width": 240,
                                                    "height": 260,
                                                    "gap": 5,
                                                    "border": 0,
                                                    "allowHanging": false
                                                },
                                                "image": {
                                                    "blur": "off",
                                                    "bw": "off"
                                                },
                                                "caption": {
                                                    "mode": "on-hover",
                                                    "color": "#FFFFFF",
                                                    "color2": "#FFFFFF",
                                                    "background_color": "#000",
                                                    "opacity": "0.8",
                                                    "effect": "fade",
                                                    "align": "center",
                                                    "position": "bottom",
                                                    "font1": {
                                                        "family": "",
                                                        "style": "",
                                                        "size": "14"
                                                    },
                                                    "font2": {
                                                        "family": "",
                                                        "style": "",
                                                        "size": "14"
                                                    }
                                                },
                                                "overlay": {
                                                    "mode": "on-hover",
                                                    "color": "#000",
                                                    "opacity": "0.3",
                                                    "effect": "fade",
                                                    "image": ""
                                                },
                                                "filters": {
                                                    "enabled": "",
                                                    "align": "center",
                                                    "sort": "1",
                                                    "style": "tabs",
                                                    "all": "All",
                                                    "color": "#FFFFFF",
                                                    "background_color": "#222222",
                                                    "accent_color": "#FFFFFF",
                                                    "accent_background_color": "#444444",
                                                    "border_radius": "0",
                                                    "list": [],
                                                    "active": "_"
                                                },
                                                "loadMore": {
                                                    "style": "load-more",
                                                    "page_size": "48",
                                                    "loading_text": "Loading...",
                                                    "load_more_text": "XEM THÊM",
                                                    "all_images_loaded": "All images loaded",
                                                    "width": "full",
                                                    "color": "#FFFFFF",
                                                    "color_loaded": "#CCCCCC",
                                                    "background_color": "#000",
                                                    "background_color_loaded": "#888888",
                                                    "shadow_width": "3",
                                                    "shadow_color": "#EEE",
                                                    "shadow_color_loaded": "#BBBBBB",
                                                    "border_radius": "0",
                                                    "vertical_padding": "12",
                                                    "horizontal_padding": "30"
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
                                                            <strong><h1>{$item->title}</h1><p></p></strong>
                                                            <span>{$item->des}</span>
                                                        </div>
                                                        <div class="banner-call-button">
                                                            <a href="{$item->detail}" class="btn" target="">
                                                                XEM THÊM!
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