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
        <section class="container-section" id="section-{$page->section}" {if $style->style eq 'shop' and $i gte 2}style="background:#ffffff;padding:{if $i eq 2}40px{else}0{/if} 10px 0 10px;"{/if}>
            <span class="move-section-button" title="Move" data-move-kind="section" data-id="{$page->id}" data-sort="{$page->sort}" draggable="true" ondragstart="drag(event)" id="move-item-{$page->section}-{$page->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                <i class="fa fa-arrows prevent_click" aria-hidden="true"></i>
            </span>
            <span class="remove-section-button" title="Remove" onclick="removePage('{$page->id}', this);">
                <i class="fa fa-trash-o prevent_click" aria-hidden="true"></i>
            </span>
            {if $page->title neq '' and $page->kind neq 'photo' and $page->kind neq 'list_2' and $page->kind neq 'list_3'}
                <div class="vc_row row editable-act-head" data-id="{$page->id}">
                    <div class="wpb_column vc_column_container vc_col-sm-12">
                        <div class="vc_column-inner vc_custom_1489660256079">
                            <div class="wpb_wrapper">
                                <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text">
                                    <span class="vc_sep_holder vc_sep_holder_l">
                                        <span  class="vc_sep_line"></span>
                                    </span>
                                    <h4 data-apply-id="{$page->id}">
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
                    <input type="hidden" data-id="{$page->id}" data-edit-type="title" value="{$page->title}" />
                    <input type="hidden" data-id="{$page->id}" data-edit-type="page" value="1" />
                    <textarea class="prevent_show" data-id="{$page->id}" data-edit-type="des" data-only-text="1">{$page->des}</textarea>
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
                                                                        <div class="cycloneslider-slide cycloneslider-slide-image editable-act" data-slider="1" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                                                            <img class="prevent_click" src="{$item->photo}" data-id="{$item->id}" data-edit-type="photo" alt="" title="" />
                                                                            {if $item->title neq ''}
                                                                                <div class="cycloneslider-caption prevent_click">
                                                                                    <div class="cycloneslider-caption-title">{$item->title}</div>
                                                                                    <div class="cycloneslider-caption-description">{$item->des}</div>
                                                                                    <a class="cycloneslider-caption-more" href="{$item->detail}">Đọc Tiếp</a>
                                                                                </div>
                                                                            {/if}
                                                                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                                                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des" data-only-text="1">{$item->des}</textarea>
                                                                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
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
                            <div class="wpb_column vc_column_container vc_col-sm-3 editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
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
                                            <a href="{$item->detail}" target="_self" class="prevent_click">
                                                <img class="banner-img" src="{$item->photo}" data-id="{$item->id}" data-edit-type="photo" width="400" height="280" alt="{$item->title}" title="{$item->title}" />
                                                <span class="ol" style="background-color: rgba(255,255,255,0.01);"></span>
                                                <span class="centered">
                                                    <span class="title wow bounce" data-wow-delay="450ms">
                                                        <strong data-apply-id="{$item->id}" data-edit-type="title">{$item->title} {$page->section}</strong>
                                                    </span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
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
                                <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text editable-act-head" data-id="{$page->id}">
                                    <span class="vc_sep_holder vc_sep_holder_l">
                                        <span  class="vc_sep_line"></span>
                                    </span>
                                        <h4 data-apply-id="{$page->id}">
                                            {$page->title}
                                            <span>{$page->des}</span>
                                        </h4>
                                        <span class="vc_sep_holder vc_sep_holder_r">
                                        <span  class="vc_sep_line"></span>
                                    </span>
                                    <input type="hidden" data-id="{$page->id}" data-edit-type="title" value="{$page->title}" />
                                    <input type="hidden" data-id="{$page->id}" data-edit-type="page" value="1" />
                                    <textarea class="prevent_show" data-id="{$page->id}" data-edit-type="des" data-only-text="1">{$page->des}</textarea>
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
                                            var options = {
                                                "id": "{$page->kind}",
                                                "scriptUrl": "/static/frontend/js/awesome-gallery-backend.js",
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
                                                    console.log(id);
                                                    console.log(url);
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
                        <div class="vc_row row editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner">
                                    <div class="wpb_wrapper">
                                        <div class="lab_wpb_banner wpb_content_element banner  banner-white text-button-center">
                                            <div class="button_outer">
                                                <div class="button_middle">
                                                    <div class="button_inner">
                                                        <div class="banner-content">
                                                            <h1><strong data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</strong></h1>
                                                            <span data-apply-id="{$item->id}" data-edit-type="des">{$item->des}</span>
                                                        </div>
                                                        {if $item->detail neq ''}
                                                            <div class="banner-call-button">
                                                                <a href="{$item->detail}" class="btn" target="" data-apply-id="{$item->id}" data-edit-type="detail">
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
                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des">{$item->des}</textarea>
                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'contact'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row vc_custom_1521533964140 vc_row-has-fill vc_row-o-content-middle vc_row-flex">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-4 editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="wpb_single_image wpb_content_element vc_align_left">
                                            <figure class="wpb_wrapper vc_figure">
                                                <a href="{$item->detail}" title="{$item->title}" target="_blank" class="vc_single_image-wrapper vc_box_border_grey prevent_click">
                                                    <img class="vc_single_image-img attachment-full prevent_click" data-id="{$item->id}" data-edit-type="photo" width="463" height="158" src="{$item->photo}" alt="{$item->title}" />
                                                    <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                                    <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
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
                    <div class="vc_row row vc_custom_1487213667707 vc_row-has-fill vc_row-o-content-middle vc_row-flex" id="parent-clone-{$page->section}">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-6 editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="vc_row wpb_row vc_inner vc_row-fluid">
                                            <div class="wpb_column vc_column_container vc_col-sm-3">
                                                <div class="vc_column-inner ">
                                                    <div class="wpb_wrapper">
                                                        <div class="wpb_single_image wpb_content_element vc_align_center">
                                                            <figure class="wpb_wrapper vc_figure">
                                                                <div class="vc_single_image-wrapper vc_box_border_grey">
                                                                    <img data-id="{$item->id}" data-edit-type="photo" data-apply-id="{$item->id}" width="128" height="128" src="{$item->photo}" alt="{$item->title}" />
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
                                                                <p><strong data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</strong></p>
                                                                <div data-apply-id="{$item->id}" data-edit-type="des">{$item->des}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des">{$item->des}</textarea>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {/if}
            {if $page->kind eq 'list_2'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row" data-id="{$item->id}">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="vc_separator wpb_content_element vc_separator_align_center vc_sep_width_100 vc_sep_shadow vc_sep_border_width_2 vc_sep_pos_align_center vc_sep_color_mulled_wine one-line-border vc_separator-has-text editable-act-head" data-id="{$page->id}">
                                        <span class="vc_sep_holder vc_sep_holder_l"><span class="vc_sep_line"></span></span>
                                        <h4 data-apply-id="{$page->id}">
                                            {$page->title}
                                            <span>{$page->des}</span>
                                        </h4>
                                        <span class="vc_sep_holder vc_sep_holder_r"><span class="vc_sep_line"></span></span>
                                        <input type="hidden" data-id="{$page->id}" data-edit-type="title" value="{$page->title}" />
                                        <input type="hidden" data-id="{$page->id}" data-edit-type="page" value="1" />
                                        <!--<textarea class="prevent_show" data-id="{$page->id}" data-edit-type="des" data-only-text="1">{$page->des}</textarea>-->
                                    </div>
                                    <div class="wpb_text_column wpb_content_element  vc_custom_1509912445903">
                                        <div class="wpb_wrapper">
                                            <div style="font-family: Arial, Verdana, Helvetica, sans-serif; line-height: 20.7999992370605px;">
                                                <div style="line-height: 20.7999992370605px;">
                                                    <div style="padding: 10px; text-align: justify; border: 6px dotted #ee7d15; border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; border-radius: 4px; outline: 0px; vertical-align: baseline; line-height: 21px; font-family: Tahoma, Geneva, sans-serif; background-repeat: no-repeat;">
                                                        {foreach from=$metadata[$page->section] key=index item=item}
                                                            <div class="editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                                                <p style="color: #000000; font-family: Arial; font-size: 15px; line-height: 20.7999992370605px;">
                                                                    <span style="font-size: 18px; font-family: arial, helvetica, sans-serif;">
                                                                        <img class=" lazyloaded" style="line-height: 18px; margin: 0px; padding: 0px; max-width: 100%; border: 0px; outline: 0px; vertical-align: baseline; width: 60px; height: 20px; background: transparent;" src="/static/frontend/images/mui-ten.gif" alt="" data-lazy-src="/static/frontend/images/mui-ten.gif" data-pagespeed-url-hash="1743886238">
                                                                        <span data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</span>
                                                                    </span>
                                                                </p>
                                                                <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                                            </div>
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
                        <div class="term-description editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                            <div data-apply-id="{$item->id}" data-edit-type="des">{$item->des}</div>
                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des">{$item->des}</textarea>
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'box'}
                {if !empty($metadata[$page->section])}
                    {foreach from=$metadata[$page->section] key=index item=item}
                        <div class="vc_row row editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
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
                                                                <h2 data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</h2>
                                                            </strong>
                                                            <p>
                                                                <strong></strong>
                                                                <span data-apply-id="{$item->id}" data-edit-type="des">{$item->des}</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des" data-only-text="1">{$item->des}</textarea>
                        </div>
                    {/foreach}
                {/if}
            {/if}
            {if $page->kind eq 'option_4'}
                {if !empty($metadata[$page->section])}
                    <div class="vc_row row">
                        {foreach from=$metadata[$page->section] key=index item=item}
                            <div class="wpb_column vc_column_container vc_col-sm-6 editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
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
                                            <a href="{$item->detail}" target="_self" class="prevent_click">
                                                <img class="banner-img " src="{$item->photo}" width="400" height="280" alt="{$item->title}" title="{$item->title}" data-id="{$item->id}" data-edit-type="photo">
                                                <span class="ol" style="background-color: rgba(255,255,255,0.01);"></span>
                                                <span class="centered">
												<span class="title wow bounce animated" data-wow-delay="450ms" style="visibility: visible; animation-delay: 450ms; animation-name: bounce;">
                                                    <strong data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</strong>
                                                </span>
                                            </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
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
                                <div class="clear"></div>
                                <div class="items">
                                    {foreach from=$metadata[$page->section] key=index item=item}
                                        <div class="col-sm-3 first post-{$item->id} product type-product status-publish has-post-thumbnail instock shipping-taxable purchasable product-type-simple editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                            <div class="item-wrapper">
                                                <div class="item">
                                                    <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link prevent_click"></a>
                                                    <div class="image full-gallery prevent_click">
                                                        <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"></a>
                                                        <a href="/san-pham/{friendly_url($item->title)}-{$item->id}" class="thumb">
                                                            <img data-id="{$item->id}" data-edit-type="photo" width="520" height="625" src="{$item->photo}" class="attachment-shop-thumb-1 size-shop-thumb-1" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="white-block description">
                                                        <h4 class="title">
                                                            <span data-apply-id="{$item->id}" data-edit-type="title" href="/san-pham/{friendly_url($item->title)}-{$item->id}">{$item->title}</span>
                                                        </h4>
                                                        <span class="type">
                                                            <a href="#" rel="tag" class="prevent_click">{$style->title}</a>
                                                        </span>
                                                        <div class="divider"></div>
                                                        <span class="price" style="width: 100%;">GIÁ SỈ:
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span data-apply-id="{$item->id}" data-edit-type="des">{$item->des}</span>
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
                                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des" data-only-text="1">{$item->des}</textarea>
                                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail">{$item->detail}</textarea>
                                        </div>
                                    {/foreach}
                                </div>
                                <div class="clear"></div>
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
                                        <div class="wpb_single_image wpb_content_element vc_align_center editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                            <figure class="wpb_wrapper vc_figure">
                                        {if $item->detail eq ''}
                                            <div class="vc_single_image-wrapper vc_box_border_grey prevent_click">
                                                <img src="{$item->photo}" class="vc_single_image-img attachment-full" data-id="{$item->id}" data-edit-type="photo" alt="{$item->title}">
                                            </div>
                                        {else}
                                            <a href="{$item->detail}" target="_blank" class="vc_single_image-wrapper vc_box_border_grey prevent_click">
                                                <img src="{$item->photo}" class="vc_single_image-img attachment-full" data-id="{$item->id}" data-edit-type="photo" alt="{$item->title}">
                                            </a>
                                        {/if}
                                            </figure>
                                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
                                        </div>
                                    {/foreach}
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
                                                <li class="editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                                    <span data-apply-id="{$item->id}" data-edit-type="title">{$item->title}</span>
                                                    <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                                </li>
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
                                                    {foreach from=$metadata[$page->section] key=index item=item}
                                                    <div class="wpb_video_wrapper editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                                        <div class="prevent_click">
                                                            <iframe width="1170" height="878" src="{$item->detail}" data-apply-id="{$item->id}" data-edit-type="detail" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe>
                                                        </div>
                                                        <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
                                                    </div>
                                                    {/foreach}
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
                                            <div class="editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                                <div data-apply-id="{$item->id}" data-edit-type="des">
                                                    {$item->des}
                                                </div>
                                                <div>
                                                    <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des">{$item->des}</textarea>
                                                </div>
                                            </div>
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
{else}
    <div data-drop-zone="1" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" ondrop="drop(event, this)" style="width: 100%;height: 200px;border: thin solid gray;text-align: center;line-height: 200px;">
        Drop section here...
    </div>
{/if}

<div class="modal" id="edit-container">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Chỉnh sửa nội dung</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="prevent_show">
                    <strong>Tiêu đề:</strong><br>
                    <input placeholder="title" class="edit-text" id="edit-content-title" value="">
                    <input id="edit-content-page" value="" type="hidden">
                    <input id="edit-content-config" value="" type="hidden">
                    <input id="edit-content-custom" value="" type="hidden">
                </div>
                <div class="prevent_show">
                    <strong>Hình ảnh:</strong><br>
                    <input placeholder="title" class="edit-text" id="edit-content-photo" readonly="readonly" value="" onclick="$('#edit-photo-container').modal('show');">
                </div>
                <div class="prevent_show" id="edit-content-container-des">
                    <strong>Tóm tắt:</strong><br>
                    <textarea class="edit-text" id="edit-content-des" style="width: 100%; height: 100px;"></textarea>
                </div>
                <div class="prevent_show" id="edit-content-container-detail">
                    <strong>Chi tiết:</strong><br>
                    <textarea class="edit-text" id="edit-content-detail" style="width: 100%; height: 250px;"></textarea>
                </div>
                <div class="prevent_show" id="edit-content-container-head">
                    <strong>Head tag:</strong><br>
                    <textarea class="edit-text" id="edit-content-head" style="width: 100%; height: 250px;"></textarea>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="saveData()">Save</button>
            </div>

        </div>
    </div>
</div>
<div class="modal" id="edit-photo-container">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Quản lý hình ảnh</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <iframe id="iframe" src="/media/filemanager/filemanager/dialog.php?type=0&field_id=choosed-photo-path&relative_url=1" style="width: 100%; height: 500px; border: none" tabindex="0"></iframe>
                <input type="hidden" id="choosed-photo-path" onchange="updatePhoto(this);" />
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="saveData()">Save</button>
            </div>
        </div>
    </div>
</div>

<menu id="ctxMenu">
    <menu title="Edit" onclick="editData();"></menu>
    <menu title="Duplicate" onclick="cloneData();"></menu>
    <menu title="Remove" onclick="removeData();"></menu>
</menu>

<style>
    .move-section-button{
        position: absolute;
        right: 0;
        top: 0;
        cursor: move;
        z-index: 999;
    }
    .remove-section-button{
        position: absolute;
        right: 16px;
        top: 0;
        cursor: move;
        z-index: 999;
    }
    .container-section{
        position: relative;
    }
    .cycloneslider-template-dark div[data-cycle-dynamic-height="off"] .cycloneslider-slide-image {
        opacity: 0.9 !important;
    }
    .edit-text{
        width: 100%;
        padding: 5px;
        margin: 10px 0;
    }
    .prevent_show{
        display: none !important;
    }
    .prevent_click{
        pointer-events: none !important;
    }
    #ctxMenu{
        display:none;
        z-index:1000;
    }
    #notepad{
        position:absolute;
        left:25%;
        top:10%;
        width:300px;
        height:300px;
        background-color:red;
    }
    menu {
        position:fixed;
        display:block;
        left:0px;
        top:0px;
        height:20px;
        width:20px;
        padding:0;
        margin:0;
        border:1px solid;
        background-color:white;
        font-weight:normal;
        white-space:nowrap;
    }
    menu:hover{
        background-color:#eef;
        font-weight:bold;
    }
    /*menu:hover > menu{
        display:block;
    }*/
    menu > menu{
        /*display:none;*/
        display:block;
        position:relative;
        top:-20px;
        left:100%;
        width:55px;
    }
    menu[title]:before{
        content:attr(title);
    }
    menu:not([title]):before{
        content:"\2630";
    }
</style>

<script>
    let sectionUrl = '{$sectionurl}';
    myMapGlobal = { };
    let switchEditor = { des: true, detail: true };
    function allowDrop(ev) {
        ev.preventDefault();
    }

    function drag(ev) {
        if(ev.target.id){
            ev.dataTransfer.setData("text", ev.target.id);
            console.log(ev.target.getAttribute('data-move-kind'));
            ev.dataTransfer.setData("sid", ev.target.getAttribute('data-id'));
            ev.dataTransfer.setData("type", ev.target.getAttribute('data-move-kind'));
            ev.dataTransfer.setData("page", sectionUrl);
        } else{
            let index = $(ev.target).index();
            let slideshow = document.getElementsByClassName('cycle-slideshow');
            if(slideshow.length > 0){
                slideshow = slideshow[0].children;
            }
            let target = slideshow[index];
            ev.dataTransfer.setData("text", target.id);
        }
    }

    function drop(ev, el) {
        ev.preventDefault();
        let data = ev.dataTransfer.getData("text");
        let source = document.getElementById(data);
        let sectionID = ev.dataTransfer.getData("sid");
        let sectionType = ev.dataTransfer.getData("type");
        let sectionPage = ev.dataTransfer.getData("page");
        let sectionDropZone = el.getAttribute('data-drop-zone');
        console.log(sectionID);
        console.log(sectionType);
        console.log(sectionPage);
        console.log(sectionDropZone);
        if(sectionType === 'section' && sectionDropZone === '1'){
            let info = {
                type:'clone', id: sectionID, custom: sectionType, section: sectionUrl, page: sectionPage
            };
            saveData(info, function(result){
                console.log('end of section...');
            });
            return true;
        }

        let target = el;
        /* neu la slide show thi keo tha xuong pager */
        if(el.getAttribute('slideshow') !== undefined && el.getAttribute('slideshow') !== null){
            try{
                let index = $(el).index();
                let slideshow = document.getElementsByClassName('cycle-slideshow');
                if(slideshow.length > 0){
                    slideshow = slideshow[0].children;
                }
                target = slideshow[index];
            } catch (e) {
                console.log(e.message);
            }
        }
        /* them cai if nay cho cai custom react awesome gallary cua facebook */
        if(target.type !== undefined && target.type === 'react-drop'){
            return false;
        }
        /*console.log(target);
        console.log(source);*/
        let targetHtml = target.innerHTML;
        let targetDataID = target.getAttribute('data-id');
        target.innerHTML = source.innerHTML;
        source.innerHTML = targetHtml;
        target.setAttribute('data-id', source.getAttribute('data-id'));
        source.setAttribute('data-id', targetDataID);
        let info = {
            type:'move', source: source.getAttribute('data-id'), target: target.getAttribute('data-id'),
            ss: source.getAttribute('data-sort'), st: target.getAttribute('data-sort')
        };
        let customType = source.querySelector('[data-edit-type="custom"]');
        if(customType !== null){
            info.custom = customType.value;
        }
        saveData(info, function(result){
            extraEventListener(source);
            extraEventListener(target);
        });
    }

    function saveData(info, callback){
        if(info === undefined){
            if(that !== null){
                info = {
                    type:'update',
                    id: that.getAttribute('data-id'),
                    title: $('#edit-content-title').val(),
                    page: $('#edit-content-page').val(),
                    config: $('#edit-content-config').val(),
                    photo: $('#edit-content-photo').val(),
                    custom: $('#edit-content-custom').val(),
                    head: $('#edit-content-head').val(),
                    des: editorDes.getValue(),
                    detail: editorDetail.getValue()
                };
                if(!switchEditor.des){
                    info.des = $("<p>").html(info.des).text()
                }
                if(!switchEditor.detail){
                    info.detail = $("<p>").html(info.detail).text()
                }
            }
        }
        $.ajax({
            type: 'post',
            url: '/backend/save',
            data: info,
            dataType: 'json',
            success: function (result) {
                console.log(result);
                if(that !== null){
                    if(info.page !== ''){
                        let dataID = that.getAttribute('data-id');
                        let datas = that.querySelectorAll('[data-apply-id="' + dataID + '"]');
                        if (datas.length > 0) {
                            for (let k = 0; k < datas.length; k++) {
                                let item = datas[k];
                                if (item.tagName === 'H4') {
                                    item.innerHTML = info.title+'<span>'+info.des+'</span>';
                                }
                            }
                        }
                    }
                    if(info.type === 'update') {
                        let dataID = that.getAttribute('data-id');
                        if (dataID !== undefined) {
                            let datas = that.querySelectorAll('[data-id="' + dataID + '"]');
                            if (datas.length > 0) {
                                for (let k = 0; k < datas.length; k++) {
                                    let item = datas[k];
                                    let editColumn = item.getAttribute('data-edit-type');
                                    if (editColumn === 'photo') {
                                        item.setAttribute('src', info.photo);
                                    } else if (editColumn === 'title') {
                                        item.value = info.title;
                                    } else if (editColumn === 'des') {
                                        item.value = info.des;
                                    } else if (editColumn === 'detail') {
                                        item.value = info.detail;
                                    } else{
                                        console.log(item);
                                    }
                                }
                            }
                            datas = that.querySelectorAll('[data-apply-id="' + dataID + '"]');
                            if (datas.length > 0) {
                                for (let k = 0; k < datas.length; k++) {
                                    let item = datas[k];
                                    console.log(item.tagName);
                                    let editColumn = item.getAttribute('data-edit-type');
                                    if (editColumn === 'photo') {
                                        if (item.tagName === 'IMG') {
                                            item.setAttribute('src', info.photo);
                                        }
                                    } else if (editColumn === 'title') {
                                        if (item.tagName === 'INPUT') {
                                            item.value = info.title;
                                        } else {
                                            item.textContent = info.title;
                                        }
                                    } else if (editColumn === 'des') {
                                        if (item.tagName === 'TEXTAREA') {
                                            item.value = info.des;
                                        } else if(item.tagName === 'A'){
                                            item.innerText = info.des;
                                        } else {
                                            item.innerHTML = info.des;
                                        }
                                    } else if (editColumn === 'detail') {
                                        if (item.tagName === 'TEXTAREA') {
                                            item.value = info.detail;
                                        } else if(item.tagName === 'A'){
                                            item.setAttribute('href', info.detail);
                                        }  else if(item.tagName === 'IFRAME'){
                                            item.setAttribute('src', info.detail);
                                        } else {
                                            item.innerHTML = info.detail;
                                        }
                                    }
                                }
                            }
                            datas = that.querySelectorAll('[data-apply-href="'+dataID+'"]');
                            if(datas.length > 0){
                                for(let k=0; k<datas.length; k++){
                                    let item = datas[k];
                                    item.setAttribute('href', result.page);
                                }
                            }
                            datas = that.querySelectorAll('[data-apply-text="'+dataID+'"]');
                            if(datas.length > 0){
                                for(let k=0; k<datas.length; k++){
                                    let item = datas[k];
                                    console.log(item.getAttribute('data-edit-type'));
                                    item.innerText = result[item.getAttribute('data-edit-type')];
                                }
                            }
                        }
                    }
                }
                if(callback !== undefined){
                    callback(result);
                }
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest.statusText);
            }
        });
    }
    function updatePhoto(item){
        document.getElementById('edit-content-photo').value = '/media/filemanager/source/'+item.value
    }
    function hideContextMenu(){
        let ctxMenu = document.getElementById("ctxMenu");
        ctxMenu.style.display = "";
        ctxMenu.style.left = "";
        ctxMenu.style.top = "";
    }
    function editData(){
        hideContextMenu();
        let dataID = that.getAttribute('data-id');
        if(dataID !== undefined){
            let datas = $(that).find("[data-id='"+dataID+"']");
            if(datas.length > 0){
                let preventShow = { };
                for(let k=0; k<datas.length; k++){
                    let item = $(datas[k]);
                    let editValue = '';
                    let editColumn = item.attr('data-edit-type');
                    preventShow[editColumn] = 1;
                    let input = null;
                    if(editColumn === 'photo'){
                        editValue = item.attr('src');
                        input = $('#edit-content-'+editColumn);
                        input.val(editValue);
                        input.parent().removeClass("prevent_show");
                    } else if(editColumn === 'title'){
                        editValue = item.val();
                        input = $('#edit-content-'+editColumn);
                        input.val(editValue);
                        input.parent().removeClass("prevent_show");
                    } else if(editColumn === 'des'){
                        editValue = item.val();
                        editorDes.setValue(editValue);
                        let onlyText = item.attr('data-only-text');
                        if(onlyText !== undefined){
                            switchEditor.des = false;
                        }
                    } else if(editColumn === 'detail'){
                        editValue = item.val();
                        editorDetail.setValue(editValue);
                        let onlyText = item.attr('data-only-text');
                        if(onlyText !== undefined){
                            switchEditor.detail = false;
                        }
                        $('#edit-content-'+editColumn).parent().removeClass("prevent_show");
                    } else{
                        editValue = item.val();
                        input = $('#edit-content-'+editColumn);
                        input.val(editValue);
                    }
                }
                if(preventShow.hasOwnProperty('photo')){
                    $('#edit-content-photo').parent().removeClass("prevent_show");
                } else{
                    $('#edit-content-photo').parent().addClass("prevent_show");
                }
                if(preventShow.hasOwnProperty('title')){
                    $('#edit-content-title').parent().removeClass("prevent_show");
                } else{
                    $('#edit-content-title').parent().addClass("prevent_show");
                }
                if(preventShow.hasOwnProperty('des')){
                    $('#edit-content-container-des').removeClass("prevent_show");
                } else{
                    $('#edit-content-container-des').addClass("prevent_show");
                }
                if(preventShow.hasOwnProperty('detail')){
                    $('#edit-content-container-detail').removeClass("prevent_show");
                } else{
                    $('#edit-content-container-detail').addClass("prevent_show");
                }
                if(preventShow.hasOwnProperty('head')){
                    $('#edit-content-container-head').removeClass("prevent_show");
                } else{
                    $('#edit-content-container-head').addClass("prevent_show");
                }
                $('#edit-container').modal('show');
            }
        }
    }
    function cloneData(){
        hideContextMenu();
        let dataID = that.getAttribute('data-id');
        if(dataID !== undefined){
            let info = {
                type:'clone', id: dataID
            };
            let customType = that.querySelector('[data-edit-type="custom"]');
            if(customType !== null){
                info.custom = customType.value;
            }
            document.body.style.cursor = 'wait';
            saveData(info, function(result){
                document.body.style.cursor = 'default';
                let cloneItem = that.cloneNode(true);
                cloneItem.setAttribute("id", 'item-'+result.section+'-'+result.id);
                cloneItem.setAttribute("data-id", result.id);
                cloneItem.setAttribute("data-sort", result.sort);
                extraEventListener(cloneItem);
                let react = cloneItem.getAttribute('data-react');
                if(react !== undefined){
                    console.log('photo -> react');
                    let items = that.parentNode.querySelectorAll('[data-react="true"]');
                    console.log(items.length);
                    if(items.length > 0) {
                        let pitem = document.getElementById('photo');
                        let secondItem = items[Math.ceil(pitem.offsetWidth/that.offsetWidth)];
                        let lastItem = items[items.length - 1];
                        let translate = lastItem.style.transform;
                        let sctranslate = secondItem.style.transform;
                        let translates = translate.replace('translate(', '').replace(')', '').replace('px', '').replace('px', '').replace(' ', '').split(',');
                        let sctranslates = sctranslate.replace('translate(', '').replace(')', '').replace('px', '').replace('px', '').replace(' ', '').split(',');
                        if (translates.length === 2) {
                            try {
                                let extrax = 219;
                                let extray = 230.694;
                                if(sctranslates.length === 2){
                                    extrax = parseFloat(sctranslates[0]);
                                    extray = parseFloat(sctranslates[1]);
                                }
                                let transx = parseFloat(translates[0]);
                                transx += extrax;
                                let transy = parseFloat(translates[1]);
                                console.log(transx + that.offsetWidth);
                                console.log(pitem.offsetWidth);
                                if((transx + that.offsetWidth) > pitem.offsetWidth){

                                    transx = 0;
                                    transy+=extray;
                                    let pheight = parseFloat(pitem.style.height.replace('px', '')) + extray;
                                    pitem.style.height = pheight+'px';
                                }
                                cloneItem.style.transform = '';
                                let transform = "translate(" + transx + "px, " + transy + "px)";
                                console.log(transform);
                                cloneItem.style.transform = transform;
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }
                }
                let dataSlider = cloneItem.getAttribute('data-slider');
                if(dataSlider !== undefined){
                    $('.cycle-slideshow').cycle('reinit');
                }
                that.parentNode.appendChild(cloneItem);
                that = null;
                let datas = cloneItem.querySelectorAll('[data-id="'+dataID+'"]');
                if(datas.length > 0){
                    for(let k=0; k<datas.length; k++){
                        let item = datas[k];
                        item.setAttribute('data-id', result.id);
                    }
                }
                datas = cloneItem.querySelectorAll('[data-apply-id="'+dataID+'"]');
                if(datas.length > 0){
                    for(let k=0; k<datas.length; k++){
                        let item = datas[k];
                        item.setAttribute('data-apply-id', result.id);
                    }
                }
                datas = cloneItem.querySelectorAll('[data-apply-href="'+dataID+'"]');
                if(datas.length > 0){
                    for(let k=0; k<datas.length; k++){
                        let item = datas[k];
                        item.setAttribute('href', result.page);
                        item.setAttribute('data-apply-href', result.id);
                    }
                }
                datas = cloneItem.querySelectorAll('[data-apply-text="'+dataID+'"]');
                if(datas.length > 0){
                    for(let k=0; k<datas.length; k++){
                        let item = datas[k];
                        item.innerText = result[item.getAttribute('data-edit-type')];
                        item.setAttribute('data-apply-text', result.id);
                    }
                }
            });
        }
    }
    function removePage(id, el){
        let info = {
            type:'remove', id: id, custom: 'page'
        };
        saveData(info, function(result){
            console.log('remove this section...');
            el.parentElement.remove();
        });
    }
    function removeData(){
        hideContextMenu();
        let dataID = that.getAttribute('data-id');
        if(dataID !== undefined){
            let info = {
                type:'remove', id: dataID
            };
            let customType = that.querySelector('[data-edit-type="custom"]');
            if(customType !== null){
                info.custom = customType.value;
            }
            that.remove();
            saveData(info, function(result){
                console.log('callback result');
                that = null;
            });
        }
    }
    function extraEventListener(editElement){
        editElement.addEventListener("contextmenu", function(event){
            event.preventDefault();
            that = this;
            let ctxMenu = document.getElementById("ctxMenu");
            ctxMenu.style.display = "block";
            ctxMenu.style.left = (event.clientX)+"px";
            ctxMenu.style.top = (event.clientY)+"px";
        }, false);
        editElement.addEventListener("click", function(event){
            that = null;
            hideContextMenu();
        }, false);
    }

    let that = null;
    setTimeout(function(){
        console.log('Editable-act init...');
        let editElements = document.getElementsByClassName('editable-act');
        if(editElements.length > 0){
            for(let index=0; index<editElements.length; index++){
                let editElement = editElements[index];
                extraEventListener(editElement);
            }
        }

        editElements = document.getElementsByClassName('editable-act-head');
        if(editElements.length > 0){
            for(let index=0; index<editElements.length; index++){
                let editElement = editElements[index];
                extraEventListener(editElement);
            }
        }
    }, 1000);
    window.onload = function(){
        $( document ).ready(function() {
            console.log( "ready!!!" );
            Simditor.locale = 'en-US';
            let toolbar = ['title', 'bold', 'italic', 'underline', 'strikethrough', 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent', 'alignment'];
            mobileToolbar = ["bold", "underline", "strikethrough", "color", "ul", "ol"];
            if (mobilecheck()) {
                toolbar = mobileToolbar;
            }
            setTimeout(function(){
                editorDes = new Simditor({
                    textarea: $('#edit-content-des'),
                    placeholder: 'Soạn nội dung',
                    toolbar: toolbar,
                    pasteImage: true,
                    defaultImage: 'assets/images/image.png',
                    upload: location.search === '?upload' ? {
                        url: '/upload'
                    } : false
                });
                editorDetail = new Simditor({
                    textarea: $('#edit-content-detail'),
                    placeholder: 'Soạn nội dung',
                    toolbar: toolbar,
                    pasteImage: true,
                    defaultImage: 'assets/images/image.png',
                    upload: location.search === '?upload' ? {
                        url: '/upload'
                    } : false
                });
            }, 10);
            $preview = $('#preview');
            if ($preview.length > 0) {
                return editor.on('valuechanged', function(e) {
                    return $preview.html(editor.getValue());
                });
            }
        });
        $( '#edit-photo-container' ).on( 'hidden.bs.modal' , function() {
            if ( $( '.modal:visible' ).length ) {
                setTimeout(function(){
                    $( 'body' ).addClass( 'modal-open' );
                }, 100);
            }
        } );
    };
</script>
<!-- Include Sim-editor file. -->
<link rel='stylesheet' href='/static/frontend/plugins/simditor/styles/simditor.css' type='text/css'/>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/mobilecheck.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/module.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/hotkeys.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/uploader.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/simditor.js'></script>


<!-- Facebook Comments Plugin for WordPress: http://peadig.com/wordpress-plugins/facebook-comments/ -->
<!--
<div class='fb-cmt'>
    <h3 class="facebook123">Bình Luật Trên Facebook</h3>
    <div class="fb-comments" data-href="https://trumgiasi.com/" data-numposts="5" data-width="100%" data-colorscheme="light"></div>
</div>
-->