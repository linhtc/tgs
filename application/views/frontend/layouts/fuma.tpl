
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Mectronic Technology</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Thiết kế sản phẩm CNC, sản phẩm khuôn, Sheet metal" name="keywords">
    <meta content="Thiết kế, gia công và sản xuất sản phẩm CNC, sản phẩm khuôn, Sheet metal" name="description">

    <!-- Favicons -->
    <link href="/static/frontend/img/icons/favicon.ico" rel="icon">
    <link href="/static/frontend/img/logo2.png" rel="apple-touch-icon">

    <!-- Bootstrap CSS File -->
    <link href="/static/frontend/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/static/frontend/fonts/font-awesome/font-awesome.min.css" rel="stylesheet">
    <link href="/static/frontend/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/static/frontend/fonts/ionicons/ionicons.min.css" rel="stylesheet">
    <link href="/static/frontend/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/static/frontend/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <!-- Main Stylesheet File -->
    <link href="/static/frontend/css/fuma.style.css" rel="stylesheet">
</head>

<body>
<!--==========================
  Header
============================-->
<header id="header">
    <div class="container-fluid">
        <div id="logo" class="pull-left">
            <h1>
                <a href="{base_url()}" class="scrollto">
                    <img src="{$this->session->userdata('logo')->background}" />
                </a>
            </h1>
        </div>
        <nav id="nav-menu-container">
            <ul class="nav-menu">
                <li class="menu-active"><a href="#intro">{lang('trang chu')}</a></li>
                <li><a href="#about">{lang('gioi thieu')}</a></li>
                <li><a href="#portfolio">{lang('thiet ke')}</a>
                    <ul>
                        <li><a href="#web">{lang('san pham cncn')}</a></li>
                        <li><a href="#web">{lang('san pham khuon')}</a></li>
                        <li><a href="#web">{lang('sheet metal')}</a></li>
                    </ul>
                </li>
                <li><a href="#skills">{lang('cong nghe')}</a></li>
                <li><a href="#recuitment">{lang('tuyen dung')}</a></li>
                <li><a href="#footer">{lang('lien he')}</a></li>
            </ul>
        </nav><!-- #nav-menu-container -->
    </div>  </header><!-- #header -->
<!--==========================
  Intro Section
============================-->
{if !empty($sliders)}
<section id="intro">
    <div class="intro-container">
        <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">

            <ol class="carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

                {foreach from=$sliders key=i item=slider}
                <div class="carousel-item{if $i eq 1} active{/if}">
                    <div class="carousel-background"><img src="{$slider->background}" alt="{lang($slider->title)}"></div>
                    <div class="carousel-container">
                        <div class="carousel-content">
                            <h2>{lang($slider->title)}</h2>
                            <p>{lang($slider->sub)}</p>
                            <a href="#" class="btn-get-started scrollto">{lang('xem')}</a>
                        </div>
                    </div>
                </div>
                {/foreach}

                <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">{lang('previous')}</span>
                </a>

                <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">{lang('next')}</span>
                </a>

            </div>
        </div>
</section>
{/if}
<!-- #intro -->

<main id="main">

    <!--==========================
      Featured Services Section
    ============================-->
    {if !empty($intros)}
    <section id="featured-services">
        <div class="container">
            <div class="row">
                {foreach from=$intros key=i item=intro}
                <div class="col-lg-4 box">
                    <i class="{$intro->icon}"></i>
                    <h4 class="title"><a href="javascript:void(0);" onclick="showIntro(this);">{lang($intro->title)}</a></h4>
                    <p class="description">{lang($intro->sub)}</p>
                    <p class="intro-content" style="display: none;">{lang($intro->content)}</p>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
    {/if}
    <!-- #featured-services -->

    <!--==========================
      About Us Section
    ============================-->
    {if !empty($abouts)}
    <section id="about" class="product">
        <div class="container">

            <header class="section-header">
                <h3>{lang('gioi thieu')}</h3>
                <p>{lang('vai dong gioi thieu')}</p>
            </header>
            <div class="row about-cols">
                {foreach from=$abouts key=i item=about}
                <div class="col-md-4 wow fadeInUp" data-wow-delay="0.{$i}s">
                    <div class="about-col">
                        <div class="img">
                            <img src="{$about->background}" alt="{lang($about->title)}" title="{lang($about->title)}" class="img-fluid">
                            <div class="icon"><i class="ion-ios-list-outline"></i></div>
                        </div>
                        <h2 class="title"><a href="#">{lang($about->title)}</a></h2>
                        <p>{lang($about->content)}</p>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
    {/if}
    <!-- #about -->

    <!--==========================
      Services Section
    ============================-->
    {if !empty($designServices)}
    <section id="services">
        <div class="container">

            <header class="section-header wow fadeInUp">
                <h3>{lang('thiet ke')}</h3>
                <p><!--Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus, ad pro quaestio laboramus. Ei ubique vivendum pro. At ius nisl accusam lorenta zanos paradigno tridexa panatarel.--></p>
            </header>

            <div class="row">
                {foreach from=$designServices key=i item=service}
                    {assign var=$index value=$i+1}
                    {assign var=$duration value=$index*5}
                <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="0.{$duration}s">
                    <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
                    <h4 class="title">
                        <a href="#">{lang($service->title)}</a>
                    </h4>
                    <p class="description">{lang($service->sub)}</p>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
    {/if}
    <!-- #services -->

    <!--==========================
      Call To Action Section
    ============================-->
    <section id="call-to-action" class="wow fadeIn">
        <div class="container text-center">
            <h3>{lang('vi sao ban nen chon chung toi')}</h3>
            <p>{lang('mo ta vi sao ban nen chon chung toi')}</p>
            <a class="cta-btn" href="javascript:void(0);">
                {lang($this->session->userdata('sys_cnf')->cnf_hotline->n)}: {lang($this->session->userdata('sys_cnf')->cnf_hotline->v1)}
            </a>
        </div>
    </section><!-- #call-to-action -->

    <!--==========================
      Skills Section
    ============================-->
    {if !empty($designServices)}
    <section id="skills">
        <div class="container">

            <header class="section-header">
                <h3>{lang('cong nghe')}</h3>
                <p>{lang('mo ta cho phan cong nghe')}</p>
            </header>
            <div class="skills-content">
                {foreach from=$technologyServices key=i item=technology}
                <div class="progress">
                    <div class="progress-bar {$technology->icon}" role="progressbar" aria-valuenow="{$technology->sub}" aria-valuemin="0" aria-valuemax="100">
                        <span class="skill">{lang($technology->title)} <i class="val">{$technology->sub}%</i></span>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
    {/if}
    <!-- #Skills -->

    <!--==========================
      Facts Section
    ============================-->
    <!--<section id="facts"  class="wow fadeIn">
      <div class="container">

        <header class="section-header">
          <h3>Facts</h3>
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </header>

        <div class="row counters">

  				<div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">274</span>
            <p>Clients</p>
  				</div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">421</span>
            <p>Projects</p>
  				</div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">1,364</span>
            <p>Hours Of Support</p>
  				</div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">18</span>
            <p>Hard Workers</p>
  				</div>

  			</div>

        <div class="facts-img">
          <img src="http://firefuma.vn/themes/public/default/img/facts-img.png" alt="" class="img-fluid">
        </div>

      </div>
    </section>--><!-- #facts -->

    <!--==========================
      Portfolio Section
    ============================-->
    {if !empty($designs)}
    <section id="portfolio"  class="section-bg" >
        <div class="container">
            <header class="section-header">
                <h3 class="section-title">{lang('thu vien anh')}</h3>
            </header>

            <div class="row">
                <div class="col-lg-12">
                    <ul id="portfolio-flters">
                        <li data-filter="*" class="filter-active">{lang('all')}</li>
                        <li data-filter=".filter-cnc" id="portfolio-cnc">{lang('cnc')}</li>
                        <li data-filter=".filter-part">{lang('part')}</li>
                        <li data-filter=".filter-sheet_metal">{lang('sheet metal')}</li>
                    </ul>
                </div>
            </div>

            <div class="row portfolio-container">
                {foreach from=$designs key=i item=design}
                <div class="col-lg-4 col-md-6 portfolio-item filter-{$design->kind} wow fadeInUp" data-wow-delay="0.1s">
                    <div class="portfolio-wrap">
                        <figure>
                            <img src="{$design->background}" class="img-fluid" alt="{lang($design->title)}" title="{lang($design->title)}">
                            <a href="{$design->background}" class="link-preview" data-lightbox="portfolio" data-title="{lang($design->title)}" title="{lang('xem')}">
                                <i class="ion ion-eye"></i>
                            </a>
                            <a href="#" class="link-details" title="{lang('chi tiet')}"><i class="ion ion-android-open"></i></a>
                        </figure>

                        <div class="portfolio-info">
                            <h4><a href="#">{lang($design->title)}</a></h4>
                            <p>{lang($design->kind)}</p>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>

        </div>
    </section>
    {/if}
    <!-- #portfolio -->

    {if !empty($designPros)}
    <section id="web">
        <div class="container">
            <header class="section-header" style="padding-top:50px;">
                <h3>{lang('thiet ke chuyen nghiep')}</h3>
                <p>{lang('mo ta cho phan thiet ke chuyen nghiep')}</p>
            </header>

            <div class="row about-cols">
                {foreach from=$designPros key=i item=pro}
                <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="about-col">
                        <div class="img">
                            <a title="{lang($pro->title)}" href="#">
                                <img src="{$pro->background}" alt="{lang($pro->title)}" class="img-fluid">
                            </a>
                        </div>
                        <h2 class="title">
                            <a title="{lang($pro->title)}" href="#">{lang($pro->title)}</a>
                        </h2>
                    </div>
                </div>
                {/foreach}
                <!--
                <div class="row text-center" data-wow-delay="0.2s">
                    <div class="col-md-12">
                        <a href="#" class="btn-get-started scrollto text-center">Xem thêm</a>
                    </div>
                </div>
                -->
            </div>
    </section>
    {/if}
    <!-- #about -->
    <!--==========================
      Clients Section
    ============================-->
    {if !empty($customers)}
    <section id="clients" class="wow fadeInUp">
        <div class="container">

            <header class="section-header">
                <h3>{lang('khach hang')}</h3>
            </header>

            <div class="owl-carousel clients-carousel">
                {foreach from=$customers key=i item=customer}
                <img src="{$customer->background}" alt="{lang($customer->title)}">
                {/foreach}
            </div>

        </div>
    </section>
    {/if}
    <!-- #clients -->

    <!--==========================
      Clients Section
    ============================-->
    {if !empty($comments)}
    <section id="testimonials" class="section-bg wow fadeInUp">
        <div class="container">

            <header class="section-header">
                <h3>{lang('ho noi ve chung toi')}</h3>
            </header>

            <div class="owl-carousel testimonials-carousel">
                {foreach from=$comments key=i item=comment}
                <div class="testimonial-item">
                    <img src="{$comment->background}" class="testimonial-img" alt="{lang($comment->title)}">
                    <h3>{lang($comment->title)}</h3>
                    <!--<h4>Ceo &amp; Founder</h4>-->
                    <p>
                        <img src="/static/frontend/img/quote-sign-left.png" class="quote-sign-left" alt="quote">
                        {lang($comment->content)}
                        <img src="/static/frontend/img/quote-sign-right.png" class="quote-sign-right" alt="quote">
                    </p>
                </div>
                {/foreach}
            </div>

        </div>
    </section>
    {/if}
    <!-- #testimonials -->

    <!--==========================
      Team Section
    ============================-->
    <!--<section id="team">
      <div class="container">
        <div class="section-header wow fadeInUp">
          <h3>Nhân sự</h3>
          <p>Firefuma là một đội ngũ các chuyên gia CNTT với các kỹ sư giàu kinh nghiệm cũng với sự năng động, đầy nhiệt huyết của các bạn trẻ.</p>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 wow fadeInUp">
            <div class="member">
              <img src="http://firefuma.vn/themes/public/default/img/nhansu1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Mr. Son Nguyen</h4>
                  <span>Manager</span>
                  <div class="social">
                    <a href=""><i class="fa fa-twitter"></i></a>
                    <a href=""><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-google-plus"></i></a>
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
            <div class="member">
              <img src="http://firefuma.vn/themes/public/default/img/nhansu1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Mr. Ben Nguyen</h4>
                  <span>Manager</span>
                  <div class="social">
                    <a href=""><i class="fa fa-twitter"></i></a>
                    <a href=""><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-google-plus"></i></a>
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
            <div class="member">
              <img src="http://firefuma.vn/themes/public/default/img/nhansu1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Mr. Vuong Nguyen</h4>
                  <span>Developer</span>
                  <div class="social">
                    <a href=""><i class="fa fa-twitter"></i></a>
                    <a href=""><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-google-plus"></i></a>
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="member">
              <img src="http://firefuma.vn/themes/public/default/img/nhansu2.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Miss. Nhung Nguyen</h4>
                  <span>Accountant</span>
                  <div class="social">
                    <a href=""><i class="fa fa-twitter"></i></a>
                    <a href=""><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-google-plus"></i></a>
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>--><!-- #team -->
</main>  <!--==========================
    Footer
  ============================-->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 footer-info">
                    <a href="{base_url()}"><img src="{$this->session->userdata('logo')->background}" /></a>
                    <p>{lang($this->session->userdata('logo')->sub)}</p>
                </div>
                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>{lang('danh muc')}</h4>
                    <ul>
                        <li><i class="ion-ios-arrow-right"></i> <a title="{lang('gioi thieu')}" href="#about">{lang('gioi thieu')}</a></li>
                        <li><i class="ion-ios-arrow-right"></i> <a title="{lang('thiet ke')}" href="#portfolio">{lang('thiet ke')}</a></li>
                        <li><i class="ion-ios-arrow-right"></i> <a title="{lang('cong nghe')}" href="#skills">{lang('cong nghe')}</a></li>
                        <li><i class="ion-ios-arrow-right"></i> <a title="{lang('chinh sach')}" href="javascript:void(0);">{lang('chinh sach')}</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 footer-contact">
                    <h4>{$this->session->userdata('logo')->title}</h4>
                    <p>
                        <strong>{lang($this->session->userdata('sys_cnf')->cnf_phone->n)}:</strong>
                        {lang($this->session->userdata('sys_cnf')->cnf_phone->v1)}<br>
                        <strong>{lang($this->session->userdata('sys_cnf')->cnf_mobile->n)}:</strong>
                        {lang($this->session->userdata('sys_cnf')->cnf_mobile->v1)}<br>
                        <strong>{lang('email')}:</strong>
                        {lang($this->session->userdata('sys_cnf')->cnf_mail_sale->v1)}
                    </p>

                    <div class="social-links">
                        <a href="{$this->session->userdata('sys_cnf')->cnf_twitter->v1}" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="{$this->session->userdata('sys_cnf')->cnf_facebook->v1}" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="javascript:void(0);" class="google-plus"><i class="fa fa-google-plus"></i></a>
                        <a href="{$this->session->userdata('sys_cnf')->cnf_youtube->v1}" class="google-plus"><i class="fa fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 footer-newsletter">
                    <h4>{lang('dang ky nhan ban tin')}</h4>
                    <p>{lang('mo ta dang ky nhan ban tin')}</p>
                    <form action="" method="post">
                        <input type="email" name="email" title="email" /><input type="submit" value="{lang('dang ky')}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong>Mectronic</strong>. All Rights Reserved
        </div>
        <div class="credits">
            <a href="{base_url()}">Design by</a> Mectronic
        </div>
    </div>  </footer><!-- #footer -->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="/static/frontend/lib/jquery/jquery.min.js"></script>
<script src="/static/frontend/lib/jquery/jquery-migrate.min.js"></script>
<script src="/static/frontend/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/static/frontend/lib/easing/easing.min.js"></script>
<script src="/static/frontend/lib/superfish/hoverIntent.js"></script>
<script src="/static/frontend/lib/superfish/superfish.min.js"></script>
<script src="/static/frontend/lib/wow/wow.min.js"></script>
<script src="/static/frontend/lib/waypoints/waypoints.min.js"></script>
<script src="/static/frontend/lib/counterup/counterup.min.js"></script>
<script src="/static/frontend/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/static/frontend/lib/isotope/isotope.pkgd.min.js"></script>
<script src="/static/frontend/lib/lightbox/js/lightbox.min.js"></script>
<script src="/static/frontend/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="/static/frontend/js/fuma.contact.form.js"></script>

<!-- Template Main Javascript File -->
<script src="/static/frontend/js/fuma.main.js"></script>
</body>
</html>
