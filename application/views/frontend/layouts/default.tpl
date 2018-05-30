<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <title>{$this->session->userdata('logo')->title}</title>
    <meta name="keywords" content="{$this->session->userdata('logo')->title}" />
    <meta name="description" content="{$this->session->userdata('logo')->sub}">
    <meta name="author" content="agikigi.com">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Theme CSS -->
    <link type="text/css" media="screen" rel="stylesheet" href="/static/frontend/css/style.css?v=7"/>
    <!-- Responsive CSS -->
    <link type="text/css" media="screen" rel="stylesheet" href="/static/frontend/css/theme-responsive.css?v=103"/>
    <!-- Skins Theme -->
    {*<link type="text/css" media="screen" rel="stylesheet" href="#" class="skin_color"/>*}
    <link type="text/css" media="screen" rel="stylesheet" href="/static/frontend/css/custom.css?v=5"/>
    {*<link type="text/css" media="screen" rel="stylesheet" href="/static/frontend/template/vmcslider/css/style.css"/>*}

    <!-- Head Libs -->
    <script src="/static/frontend/js/modernizr.js"></script>

    <!-- Favicons -->
    <link rel="shortcut icon" href="/static/frontend/img/icons/favicon.ico">
    <link rel="apple-touch-icon" href="/static/frontend/img/logo2.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/static/frontend/img/logo2.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/static/frontend/img/logo2.png">

    <!-- styles for IE -->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/frontend/css/ie/ie.css" type="text/css" media="screen"/>
    <![endif]-->

    <!--[if lte IE 8]>
    <script src="/static/frontend/js/responsive/html5shiv.js"></script>
    <script src="/static/frontend/js/responsive/respond.js"></script>
    <![endif]-->
</head>
<body>

<!--Preloader-->
<div class="preloader">
    <div class="status">&nbsp;</div>
</div>
<!--End Preloader-->

<div id="home"></div>

<!-- layout-->
<div id="layout" class="layout-wide style-light">
    <!-- Login Client -->
    <div class="jBar">
        <div class="container">
            <div class="row padding-top-mini">
                <!-- Item service-->
                <div class="col-md-12">
                    <div class="item-service">
                        <p>{lang($this->session->userdata('sys_cnf')->cnf_intro->v1)}</p>
                    </div>
                </div>
                <!-- End Item service-->

                <span class="jTrigger downarrow"><i class="fa fa-minus"></i></span>
            </div>
        </div>
    </div>
    <span class="jRibbon jTrigger up" title="{lang('introduce')}"><i class="fa fa-plus"></i></span>
    <div class="line"></div>
    <!-- End Login Client -->

    <!-- Info Head -->
    <section class="info-head">
        <div class="container">
            <ul>
                <li><i class="fa fa-headphones"></i>{lang($this->session->userdata('sys_cnf')->cnf_mobile->v1)}</li>
                <li><i class="fa fa-comment"></i>
                    <a href="javascript:void(0);" onclick='$("a[href$=\"contact\"]").click();'>{lang('live chat')}</a>
                </li>
                <li>
                    <ul>
                        <li class="dropdown">
                            <i class="fa fa-globe"></i>
                            <a style="padding-left: 0;" class="dropdown-toggle" data-toggle="dropdown" href="#">Language<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="{if $this->session->userdata('lang_key') eq 'vi'}javascript:void(0);{else}/{/if}" onclick="changeLanguage('vi');">
                                        <img class="flag-nation" src="/static/frontend/img/language/vi.svg" alt="vi">Vietnam
                                    </a>
                                </li>
                                <li>
                                    <a href="{if $this->session->userdata('lang_key') eq 'jp'}javascript:void(0);{else}/jp{/if}" onclick="changeLanguage('jp');">
                                        <img class="flag-nation" src="/static/frontend/img/language/jp.svg" alt="jp">Japan
                                    </a>
                                </li>
                                <li>
                                    <a href="{if $this->session->userdata('lang_key') eq 'cn'}javascript:void(0);{else}/cn{/if}" onclick="changeLanguage('cn');">
                                        <img class="flag-nation" src="/static/frontend/img/language/cn.svg" alt="cn">China
                                    </a>
                                </li>
                                <li>
                                    <a href="{if $this->session->userdata('lang_key') eq 'en'}javascript:void(0);{else}/en{/if}" onclick="changeLanguage('en');">
                                        <img class="flag-nation" src="/static/frontend/img/language/en.svg" alt="en">English
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>
    <!-- Info Head -->

    <!-- Header-->
    <header>
        <!-- Container-->
        <div class="container">
            <!-- Row-->
            <div class="row">
                <!-- Logo-->
                <div class="col-md-3">
                    <div class="logo">
                        <a href="/{$this->session->userdata('lang_prefix')}" title="{lang('trang chu')}">
                            <img src="{$this->session->userdata('logo')->background}" alt="{$this->session->userdata('logo')->title}" class="logo_img">
                        </a>
                    </div>
                </div>
                <!-- End Logo-->

                <!-- Nav-->
                <nav class="col-md-9">
                    <!-- Menu-->
                    <ul id="menu" class="sf-menu l_tinynav1 sf-js-enabled sf-arrows">
                        <li class=""><a href="#home">{lang('trang chu')}</a></li>
                        <li>
                            <a href="#design" class="sf-with-ul">{lang('thiet ke')}<i class="fa fa-angle-down"></i></a>
                            <ul style="display: none;">
                                <li><a href="#design-cnc">{lang('san pham cnc')}</a></li>
                                <li><a href="#design-part">{lang('san pham khuon')}</a></li>
                                <li><a href="#design-sheet-metal">{lang('sheet metal')}</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="#technology">{lang('cong nghe')}</a></li>
                        {*<li><a href="#work">RECENT PROJECTS</a></li>*}
                        <li><a href="#team">{lang('tuyen dung')}</a></li>
                        <li><a href="#contact">{lang('lien he')}</a></li>
                    </ul>
                    <!-- End Menu-->
                </nav>
                <!-- End Nav-->
            </div>
            <!-- End Row-->
        </div>
        <!-- End Container-->
    </header>
    <!-- End Header-->

    <!-- Slide Section-->
    {if !empty($sliders)}
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                {foreach from=$sliders key=i item=slider}
                <!-- SLIDE  -->
                <li data-transition="fade" data-slotamount="7" data-masterspeed="1000" data-delay="5000" >
                    <!-- MAIN IMAGE -->
                    <img src="{$slider->background}"  alt="newslide2014_1"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->

                    <!-- LAYER NR. 1 -->
                    <div class="tp-caption finewide_large_white customin customout tp-resizeme"
                         data-x="center" data-hoffset="0"
                         data-y="center" data-voffset="-40"
                         data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                         data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                         data-speed="500"
                         data-start="500"
                         data-easing="Power3.easeInOut"
                         data-splitin="chars"
                         data-splitout="chars"
                         data-elementdelay="0.08"
                         data-endelementdelay="0.08"
                         data-end="4000"
                         data-endspeed="500"
                         style="z-index: 2; white-space: nowrap;">{lang($slider->title)}
                    </div>

                    <!-- LAYER NR. 2 -->
                    <div class="tp-caption whitedivider3px customin customout tp-resizeme"
                         data-x="center" data-hoffset="0"
                         data-y="center" data-voffset="0"
                         data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                         data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                         data-speed="700"
                         data-start="800"
                         data-easing="Power3.easeInOut"
                         data-splitin="none"
                         data-splitout="none"
                         data-elementdelay="0.1"
                         data-endelementdelay="0.1"
                         data-end="4000"
                         data-endspeed="500"
                         style="z-index: 3; white-space: nowrap;">&nbsp;
                    </div>

                    <!-- LAYER NR. 3 -->
                    <div class="tp-caption finewide_medium_white randomrotate customout tp-resizeme"
                         data-x="center" data-hoffset="0"
                         data-y="center" data-voffset="30"
                         data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                         data-speed="500"
                         data-start="500"
                         data-easing="Power3.easeInOut"
                         data-splitin="chars"
                         data-splitout="chars"
                         data-elementdelay="0.08"
                         data-endelementdelay="0.08"
                         data-end="4000"
                         data-endspeed="500"
                         style="z-index: 4; white-space: nowrap;">{lang($slider->sub)}
                    </div>

                </li>
                {/foreach}
            </ul>
            <div class="tp-bannertimer"></div>
        </div>
    </div>
    {/if}
    <!-- End Slide Section-->

    <!-- Design -->
    {if !empty($designServices)}
    <section class="content_info" id="design">
        <div class="paddings">
            <div class="container">
                <!-- Icon Big -->
                <i class="fa fa-cogs icon-section top right"></i>
                <!-- End Icon Big -->

                <!-- Titles Heading -->
                <div class="titles-heading">
                    <div class="line"></div>
                    <h1>{lang('thiet ke')}
                        <span>
                          <i class="fa fa-star"></i>
                          {lang('phu de thiet ke')}
                          <i class="fa fa-star"></i>
                        </span>
                    </h1>
                </div>
                <!-- End Titles Heading -->

                <!-- Row fuid-->
                <div class="row padding-top">
                    {foreach from=$designServices key=i item=designService}
                        <!-- Item service - 01 -->
                        <div class="col-md-4">
                            <div class="item-service border-right">
                                <div class="row head-service">
                                    <div class="col-md-2">
                                        <i class="fa {$designService->icon}"></i>
                                    </div>
                                    <div class="col-md-10">
                                        <h4>{lang($designService->title)}</h4>
                                        <h5>{lang($designService->sub)}</h5>
                                    </div>
                                </div>
                                <p>{lang($designService->content)}</p>
                            </div>
                        </div>
                        <!-- End Item service-->
                    {/foreach}
                </div>
                <!-- End Row fuid-->
            </div>
            <!-- End Container-->
        </div>
    </section>
    {/if}
    <!-- End Design-->

    <!-- CNC Design -->
    <section class="content_info design-class" id="design-cnc">
        <div class="paddings borders section-gray pattern-portfolios">

            <!-- Title Heading -->
            <h2 class="text-center">{lang('san pham cnc')}</h2>
            <!-- End Title Heading -->

            <!-- Items Works -->
            <ul id="design-cncs" class="works padding-top-mini">

                {for $index=$start to $designs|count}
                    {if $designs[$index]->kind neq 'cnc'}
                        {assign var="start" value=$index}
                        {break}
                    {/if}
                <!-- Item Work -->
                <li class="item-work">
                    <div class="hover">
                        <img src="{$designs[$index]->background}" alt="{$designs[$index]->title}"/>
                        <a href="{$designs[$index]->background}" class="fancybox" title="Image"><div class="overlay"></div></a>
                    </div>
                    <div class="info-work">
                        <h4>{lang($designs[$index]->title)}</h4>
                        <p>{lang($designs[$index]->sub)}</p>
                        {*<div class="icons-work">
                            <i class="fa fa-tablet" data-toggle="tooltip" title data-original-title="Responsive Desing"></i>
                            <i class="fa fa-desktop" data-toggle="tooltip" title data-original-title="Retina Display"></i>
                        </div>*}
                    </div>
                </li>
                <!-- Item Work -->
                {/for}

            </ul>
            <!-- End Items Works -->
        </div>
    </section>
    <!-- End CNC Design-->

    <!-- Part Design -->
    <section class="content_info design-class" id="design-part">
        <div class="paddings borders section-gray pattern-portfolios">

            <!-- Title Heading -->
            <h2 class="text-center">{lang('san pham khuon')}</h2>
            <!-- End Title Heading -->

            <!-- Items Works -->
            <ul id="design-parts" class="works padding-top-mini">

                {for $index=$start to $designs|count}
                    {if $designs[$index]->kind neq 'part'}
                        {assign var="start" value=$index}
                        {break}
                    {/if}
                    <!-- Item Work -->
                    <li class="item-work">
                        <div class="hover">
                            <img src="{$designs[$index]->background}" alt="{$designs[$index]->title}"/>
                            <a href="{$designs[$index]->background}" class="fancybox" title="Image"><div class="overlay"></div></a>
                        </div>
                        <div class="info-work">
                            <h4>{lang($designs[$index]->title)}</h4>
                            <p>{lang($designs[$index]->sub)}</p>
                            {*<div class="icons-work">
                                <i class="fa fa-tablet" data-toggle="tooltip" title data-original-title="Responsive Desing"></i>
                                <i class="fa fa-desktop" data-toggle="tooltip" title data-original-title="Retina Display"></i>
                            </div>*}
                        </div>
                    </li>
                    <!-- Item Work -->
                {/for}

            </ul>
            <!-- End Items Works -->
        </div>
    </section>
    <!-- End Part Design-->

    <!-- Sheet Metal Design -->
    <section class="content_info design-class" id="design-sheet-metal">
        <div class="paddings borders section-gray pattern-portfolios">

            <!-- Title Heading -->
            <h2 class="text-center">{lang('sheet metal')}</h2>
            <!-- End Title Heading -->

            <!-- Items Works -->
            <ul id="design-sheet-metals" class="works padding-top-mini">

                {for $index=$start to $designs|count}
                    {if $designs[$index]->kind neq 'sheet_metal'}
                        {assign var="start" value=$index}
                        {break}
                    {/if}
                    <!-- Item Work -->
                    <li class="item-work">
                        <div class="hover">
                            <img src="{$designs[$index]->background}" alt="{$designs[$index]->title}"/>
                            <a href="{$designs[$index]->background}" class="fancybox" title="Image"><div class="overlay"></div></a>
                        </div>
                        <div class="info-work">
                            <h4>{lang($designs[$index]->title)}</h4>
                            <p>{lang($designs[$index]->sub)}</p>
                            {*<div class="icons-work">
                                <i class="fa fa-tablet" data-toggle="tooltip" title data-original-title="Responsive Desing"></i>
                                <i class="fa fa-desktop" data-toggle="tooltip" title data-original-title="Retina Display"></i>
                            </div>*}
                        </div>
                    </li>
                    <!-- Item Work -->
                {/for}

            </ul>
            <!-- End Items Works -->
        </div>
    </section>
    <!-- End Sheet Metal Design-->

    <!-- Technology -->
    {if !empty($technologyServices)}
    <section class="content_info" id="technology">
        <div class="paddings">
            <div class="container">
                <!-- Icon Big -->
                <i class="fa fa-cogs icon-section top right"></i>
                <!-- End Icon Big -->

                <!-- Titles Heading -->
                <div class="titles-heading">
                    <div class="line"></div>
                    <h1>{lang('cong nghe')}
                        <span>
                          <i class="fa fa-star"></i>
                            {lang('phu de cong nghe')}
                          <i class="fa fa-star"></i>
                        </span>
                    </h1>
                </div>
                <!-- End Titles Heading -->

                <!-- Row fuid-->
                <div class="row padding-top">
                    {foreach from=$technologyServices key=i item=technologyService}
                        <!-- Item service - 01 -->
                        <div class="col-md-4">
                            <div class="item-service border-right">
                                <div class="row head-service">
                                    <div class="col-md-2">
                                        <i class="fa {$technologyService->icon}"></i>
                                    </div>
                                    <div class="col-md-10">
                                        <h4>{lang($technologyService->title)}</h4>
                                        <h5>{lang($technologyService->sub)}</h5>
                                    </div>
                                </div>
                                <p>{lang($technologyService->content)}</p>
                            </div>
                        </div>
                        <!-- End Item service-->
                    {/foreach}
                </div>
                <!-- End Row fuid-->
            </div>
            <!-- End Container-->
        </div>
    </section>
    {/if}
    <!-- End Technology-->

    <!-- End content info - Video Section -->
    {if $this->session->userdata('sys_cnf')->cnf_video}
    <section class="content_info overflow-hidde">
        <!-- Video Background -->
        <video class="bg_video" preload="auto" autoplay="autoplay" loop muted poster='/static/frontend/img/slide/slides/4.jpg' data-setup="{ }">
            <source src="{$this->session->userdata('sys_cnf')->cnf_video->v1}" type="video/mp4">
        </video>

        <!-- Video Background -->

        <!-- Content Video-->
        <section class="opacy_bg_02 paddings-large">
            <div class="container wow fadeInUp">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>{lang($this->session->userdata('sys_cnf')->cnf_video->n)}</h2>
                        <p>{lang($this->session->userdata('sys_cnf')->cnf_video->v2)}</p>
                        <a href="javascript:void(0);" onclick='$("a[href$=\"contact\"]").click();' class="btn btn-primary" value="sign in">{lang('lien he ngay')}</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Content Video-->
    </section>
    {/if}
    <!-- End content info - Video Section -->

    <!-- Slides Team -->
    {if !empty($careers)}
    <section class="content_info" id="team">
        <div class="padding-top slide-team">
            <!-- Slides Team  -->
            <ul id="slide-team">

                {foreach from=$careers key=i item=career}
                    <!-- Item Slide Team  -->
                    <li>
                        <div class="container">
                            <div class="row">

                                <!-- Image Team  -->
                                <div class="col-md-3">
                                    <a href="{$career->employer_avatar}" class="fancybox">
                                        <img src="{$career->employer_avatar}" alt="" title="View Image">
                                    </a>
                                </div>
                                <!-- End Image Team  -->

                                <!-- Info  Team  -->
                                <div class="col-md-5 padding-top-mini">
                                    <h3 class="title-subtitle">
                                        {lang($career->employer_name)}
                                        <span>{lang($career->employer_position)}</span>
                                    </h3>
                                    <p><strong>[{lang('can tuyen')} {lang($career->employee_position)}]</strong> - {lang($career->employer_intro)}</p>

                                    <a href="mailto:{$career->employer_email}" target="_blank" class="btn btn-primary">{lang('gui email cho toi')}</a>

                                    <!-- Social-->
                                    <ul class="social">
                                        <li data-toggle="tooltip" title data-original-title="Facebook">
                                            <a href="{$career->employer_facebook}" target="_blank"><i class="fa fa-facebook"></i></a>
                                        </li>
                                        <li data-toggle="tooltip" title data-original-title="Twitter">
                                            <a href="{$career->employer_twitter}" target="_blank"><i class="fa fa-twitter"></i></a>
                                        </li>
                                        <li data-toggle="tooltip" title data-original-title="Youtube">
                                            <a href="{$career->employer_youtube}" target="_blank"><i class="fa fa-youtube"></i></a>
                                        </li>
                                    </ul>
                                    <!-- End Social-->

                                </div>
                                <!-- End Info  Team  -->

                                <!-- Skills Team  -->
                                <div class="col-md-4 padding-top-mini">
                                    <h3>{lang('cac ky nang')}</h3>
                                    {foreach from=$career->employee_skills key=skill item=level}
                                    <div class="meter color nostripes">
                                        <span style="width: {$level}%"><span>{lang($skill)}</span><span class="text-right">{$level}%</span></span>
                                    </div>
                                    {/foreach}
                                </div>
                                <!-- End Skills Team  -->

                            </div>
                        </div>
                    </li>
                    <!-- End Item Slide Team  -->
                {/foreach}

            </ul>
            <!-- End Slides Team  -->
        </div>
    </section>
    {/if}
    <!-- End Team Slide-->

    <!-- Important Info -->
    {if $team->background neq ''}
    <section class="content_info">
        <div class="padding-top pattern-important-info important-info">
            <div class="container text-center">
                <img src="{$team->background}" alt="{$team->title}">
                <div class="title">
                    <h1 style="white-space: pre;">{lang($team->title)}</h1>
                </div>
            </div>
        </div>
    </section>
    {/if}
    <!-- End Important Info -->

    <!-- Contact Us -->
    <section class="content_info">
        <div class="paddings" id="contact">
            <div class="container">
                <div class="row">

                    <!-- Sidebars -->
                    <div class="col-md-4 sidebars">
                        <aside>
                            <h4>{lang('tru so chinh')}</h4>
                            <address>
                                <strong>Mectronic Technology, Inc.</strong><br>
                                <i class="fa fa-map-marker"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_address->n)}: </strong>
                                <a href="{$this->session->userdata('sys_cnf')->cnf_address->v2}" target="_blank">
                                    {lang($this->session->userdata('sys_cnf')->cnf_address->v1)}
                                </a><br>
                                <i class="fa fa-plane"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_city->n)}: </strong>
                                {lang($this->session->userdata('sys_cnf')->cnf_city->v1)}<br>
                                <i class="fa fa-phone"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_phone->n)}: </strong>
                                {lang($this->session->userdata('sys_cnf')->cnf_phone->v1)}<br>
                                <i class="fa fa-mobile"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_mobile->n)}: </strong>
                                {lang($this->session->userdata('sys_cnf')->cnf_mobile->v1)}
                            </address>

                            <address class="company-email">
                                <strong>{lang('cac email cong ty')}</strong><br>
                                <i class="fa fa-envelope"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_mail_sale->n)}:</strong>
                                <a href="mailto:{$this->session->userdata('sys_cnf')->cnf_mail_sale->v1}">
                                    {$this->session->userdata('sys_cnf')->cnf_mail_sale->v1}
                                </a><br>
                                <i class="fa fa-envelope"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_mail_technical->n)}:</strong>
                                <a href="mailto:{$this->session->userdata('sys_cnf')->cnf_mail_technical->v1}">
                                    {$this->session->userdata('sys_cnf')->cnf_mail_technical->v1}
                                </a><br>
                                <i class="fa fa-envelope"></i>
                                <strong>{lang($this->session->userdata('sys_cnf')->cnf_mail_branch->n)}:</strong>
                                <a href="mailto:{$this->session->userdata('sys_cnf')->cnf_mail_branch->v1}">
                                    {$this->session->userdata('sys_cnf')->cnf_mail_branch->v1}
                                </a>
                            </address>
                        </aside>

                        <hr class="tall">

                        <aside>
                            <h4>{lang('anh hoat dong gan day')}</h4>
                            <ul id="flickr-aside" class="thumbs"></ul>
                        </aside>

                    </div>
                    <!-- End Sidebars -->

                    <!-- Content Right -->
                    <div class="col-md-8">
                        <h3>{lang($this->session->userdata('sys_cnf')->cnf_intro->n)}</h3>
                        <p class="lead">{lang($this->session->userdata('sys_cnf')->cnf_intro->v1)}</p>

                        <hr class="tall">

                        <!-- Tabs -->
                        <div class="tabs">
                            <!-- Tab nav -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#contactUs" data-toggle="tab">
                                        <i class="fa fa-bullhorn"></i>{lang('loi nhan')}</a>
                                </li>
                            </ul>
                            <!-- End Tab nav -->

                            <!-- Tab Content -->
                            <div class="tab-content">

                                <!-- Tab item -->
                                <div class="tab-pane active" id="contactUs">

                                    <h4 style="display: none;">{lang('lien he voi chung toi')}</h4>

                                    <!-- Form Contact -->
                                    <form class="form-contact" action="/contact" id="contact-form" method="post">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    <label>{lang('ho ten')} *</label>
                                                    <input type="text"  required="required" value="" maxlength="100" class="form-control" name="Name" id="name">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>{lang('thu dien tu')} *</label>
                                                    <input type="email"  required="required" value="" maxlength="100" class="form-control" name="Email" id="email">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label>{lang('loi nhan')} *</label>
                                                    <textarea maxlength="5000" rows="10" class="form-control" name="Message" id="message"  style="height: 138px;" required="required" ></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input id="contact-button" type="submit" value="{lang('gui di')}" class="btn btn-lg btn-primary">
                                            </div>
                                        </div>
                                    </form>
                                    <!-- End Form Contact -->
                                    <div class="result"></div>
                                </div>
                                <!-- End Tab item -->

                            </div>
                            <!-- End Tab Content -->
                        </div>
                        <!-- End Tabs -->

                    </div>
                    <!-- End Content Right -->

                </div>
            </div>
            <!-- End Container-->
        </div>
    </section>
    <!-- End Contact Us-->

    <!-- footer bottom-->
    <footer class="footer-bottom">
        <div class="container">
            <div class="row">

                <!-- Nav-->
                <div class="col-md-8">
                    <div class="logo-footer">
                        <h2><span>M</span>ectronic<span>.</span></h2>
                    </div>
                    <!-- Menu-->
                    <ul class="menu-footer">
                        <li><a href="javascript:void(0);" onclick='$("a[href$=\"home\"]").click();'>{lang('trang chu')}</a> </li>
                        <li><a href="javascript:void(0);" onclick='$("a[href$=\"design\"]").click();'>{lang('thiet ke')}</a></li>
                        <li><a href="javascript:void(0);" onclick='$("a[href$=\"technology\"]").click();'>{lang('cong nghe')}</a></li>
                        <li><a href="javascript:void(0);" onclick='$("a[href$=\"team\"]").click();'>{lang('tuyen dung')}</a></li>
                        <li><a href="javascript:void(0);" onclick='$("a[href$=\"contact\"]").click();'>{lang('lien he')}</a></li>
                    </ul>
                    <!-- End Menu-->

                    <!-- coopring-->
                    <div class="row coopring">
                        <div class="col-md-8">
                            <p>&copy; 2018 Mectronic Corp. All Rights Reserved.  2000 - 2018</p>
                        </div>
                    </div>
                    <!-- End coopring-->
                </div>
                <!-- End Nav-->

                <!-- Social-->
                <div class="col-md-4">
                    <!-- Social-->
                    <ul class="social">
                        <li data-toggle="tooltip" title data-original-title="{$this->session->userdata('sys_cnf')->cnf_facebook->n}">
                            <a href="{$this->session->userdata('sys_cnf')->cnf_facebook->v1}" target="_blank"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li data-toggle="tooltip" title data-original-title="{$this->session->userdata('sys_cnf')->cnf_twitter->n}">
                            <a href="{$this->session->userdata('sys_cnf')->cnf_twitter->v1}" target="_blank"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li data-toggle="tooltip" title data-original-title="{$this->session->userdata('sys_cnf')->cnf_youtube->n}">
                            <a href="{$this->session->userdata('sys_cnf')->cnf_youtube->v1}" target="_blank"><i class="fa fa-youtube"></i></a>
                        </li>
                    </ul>
                    <!-- End Social-->
                </div>
                <!-- End Social-->

            </div>

        </div>
    </footer>
    <!-- End footer bottom-->

</div>
<!-- End layout-->

<script type="text/javascript">
    baseUrl = '{base_url()}';
</script>

<!-- ======================= JQuery libs =========================== -->
<!-- jQuery local-->
<script type="text/javascript" src="/static/frontend/js/jquery.js"></script>
<!--Nav-->
<script type="text/javascript" src="/static/frontend/js/nav/tinynav.js"></script>
<script type="text/javascript" src="/static/frontend/js/hoverIntent.js"></script>
<script type="text/javascript" src="/static/frontend/js/superfish.js?v=103"></script>
<script type="text/javascript" src="/static/frontend/js/nav/hoverIntent.js"></script>
<script type="text/javascript" src="/static/frontend/js/nav/jquery.sticky.js"></script>
<!--Totop-->
<script type="text/javascript" src="/static/frontend/js/totop/jquery.ui.totop.js" ></script>
<!--Slide Revolution-->
<script type="text/javascript" src="/static/frontend/template/revolution/js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="/static/frontend/template/revolution/js/jquery.themepunch.revolution.js"></script>
<!--Ligbox-->
<script type="text/javascript" src="/static/frontend/js/fancybox/jquery.fancybox.js"></script>
<!-- carousel.js-->
<script src="/static/frontend/js/carousel/carousel.js"></script>
<!-- Twitter Feed-->
<script src="/static/frontend/js/twitter/jquery.tweet.js"></script>
<!-- flickr Feed-->
<script src="/static/frontend/js/flickr/jflickrfeed.min.js"></script>
<!--Scroll-->
<script src="/static/frontend/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Maps -->
{*<script src="/static/frontend/js/maps/gmap3.js"></script>*}
<!-- Filter -->
<script type="text/javascript" src="/static/frontend/js/filters/jquery.isotope.js"></script>
<!-- Parallax-->
<script type="text/javascript" src="/static/frontend/js/parallax/jquery.inview.js"></script>
<script type="text/javascript" src="/static/frontend/js/parallax/nbw-parallax.js"></script>
<!--Theme Options-->
{*<script type="text/javascript" src="/static/frontend/js/theme-options.js?v=103"></script>*}
{*<script type="text/javascript" src="/static/frontend/js/theme-options/jquery.cookies.js"></script>*}
<!-- Bootstrap.js-->
<script type="text/javascript" src="/static/frontend/js/bootstrap/bootstrap.js"></script>
<!-- Notify.js-->
<script type="text/javascript" src="/static/frontend/js/notify.js"></script>
<!--MAIN FUNCTIONS-->
<script type="text/javascript" src="/static/frontend/js/main.js?v=5"></script>
<!-- ======================= End JQuery libs =========================== -->

<!--Slider Function-->
<script type="text/javascript">
    let revapi;

    jQuery(document).ready(function() {

        revapi = jQuery('.tp-banner').revolution({
            startwidth:1170,
            startheight:750,
            hideThumbs:10,
            navigationType: 'none',
            navigationArrows: 'none',
            delay: 5000
        });

    });
</script>
<!--End Slider Function-->

</body>
</html>