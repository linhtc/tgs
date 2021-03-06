<!-- Sidebar Menu -->
<div class="main-sidebar">

    <div class="sidebar-inner">

        <div class="top-mobilee" style="background:#000;color:#fff;padding:10px 10px 1px 10px;">
            <p>
                <i class="fa fa-map-marker" aria-hidden="true"></i>   445/12 Quang Trung P10 Gò Vấp - HCM
            </p>
            <p><i class="fa fa-compass" aria-hidden="true"></i> <span>Tìm đường đến shop: <a href="https://goo.gl/p7BAS6">XEM BẢN ĐỒ</a></p></div>
        <!-- logo -->
        <div class="logo logo-image">

            <p>
                <a href="{base_url()}backend" class="editable-act" data-id="{$smarty.session.sys_cnf->cnf_logo->id}">
                    <img data-id="{$smarty.session.sys_cnf->cnf_logo->id}" data-edit-type="photo" src="{$smarty.session.sys_cnf->cnf_logo->v1}" alt="{$smarty.session.sys_cnf->cnf_logo->n}" />
                    <input type="hidden" data-id="{$smarty.session.sys_cnf->cnf_logo->id}" data-edit-type="config" value="1" />
                </a>
            </p>


            <div class="mobile-gio-hang">
                <!--<a href="/gio-hang/">
                    <span class="menu-mobile-text" style="display: block;background: red;width: 42px;height: 42px;color:white;">
                    <i class="_mi _before dashicons dashicons-cart" aria-hidden="true" style="line-height: 2;"></i>
                    </span>
                </a>-->
                <a href="tel://0919705086">
			<span class="menu-mobile-text" style="display: block;background: #06b53c;width: 42px;height: 42px;color:white;">
			<i class="_mi _before dashicons dashicons-phone" aria-hidden="true" style="line-height: 2;"></i>
			</span>
                </a>
            </div>
            <div class="mobile-menu-link">
                <a href="#">
                    <span class ="menu-mobile-text" style="display: block;background: black; color: white; text-align: center;line-height: 40px;width: 42px;height: 42px;">MENU</span>
                </a>
            </div>

            <div class="divider"></div>
        </div>
        <!-- /logo -->

        <!-- mobile menu -->
        <div class="mobile-menu hidden">

            <a href="/backend/gio-hang/" class="cart-items">
                <i class="_mi _before dashicons dashicons-cart" aria-hidden="true"></i>
                <span>0</span>
                GIỎ  HÀNG		</a>
            <ul id="menu-trum-gia-si-menu-1" class="nav">
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-1868">
                    <a href="/backend/shop/"><i class="fa fa-shopping-bag"></i>CỬA HÀNG</a>
                    <ul  class="sub-menu">
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1775">
                            <a href="/backend/shop/vay-dam-quang-chau">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 class="h2menu">VÁY ĐẦM QUẢNG CHÂU</h2>
                            </a>
                        </li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1777">
                            <a href="/backend/shop/vay-dam-thiet-ke">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 class="h2menu">VÁY ĐẦM THIẾT KẾ</h2>
                            </a>
                        </li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1778">
                            <a href="/backend/bo-si-quan-ao-quang-chau-vay-dam-thiet-ke">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 class="h2menu">BỎ SỈ QUẦN ÁO</h2>
                            </a>
                        </li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1776">
                            <a href="/backend/om-lo-hang-quang-chau-quan-ao-thiet-ke-gia-re">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 class="h2menu">ÔM LÔ QUẦN ÁO</h2>
                            </a>
                        </li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8273">
                            <a href="/backend/hang-sale-hang-xon-gia-re">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 class="h2menu">HÀNG SALE &#8211; HÀNG XÔN</h2>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8350">
                    <a href="https://goo.gl/GjqCCf">
                        <i class="fa fa-video-camera"></i>
                        VIDEO LIVESTREAM
                    </a>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2517">
                    <a href="/backend/huong-dan-mua-hang">
                        <i class="fa fa-arrow-circle-right"></i>
                        CÁCH MUA HÀNG
                    </a>
                </li>
            </ul>
            <div class="top-menu-mobile">
                <ul id="menu-top-links-1" class="sec-nav-menu">
                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8235">
                        <a href="/backend/kinh-nghiem-ban-hang">
                            KINH NGHIỆM
                        </a>
                    </li>
                    <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-5443">
                        <a href="/backend/bo-si-quan-ao-quang-chau-vay-dam-thiet-ke">
                            BỎ SỈ
                        </a>
                    </li>
                    <li class="menu-item menu-item-type-post_type menu-item-object-post menu-item-5543">
                        <a href="/backendom-lo-hang-quang-chau-quan-ao-thiet-ke-gia-re">
                            ÔM LÔ
                        </a>
                    </li>
                    <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-5444">
                        <a href="/backend/tuyen-cong-tac-vien-ban-hang-online">
                            TUYỂN CTV
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- / mobile menu -->

        <div class="sidebar-menu">
            <ul id="menu-trum-gia-si-menu-2" class="nav">
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-1868">
                    {if !empty($smarty.session.sys_router)}
                    <a href="#"><i class="fa fa-shopping-bag"></i>CỬA HÀNG</a>
                    <ul  class="sub-menu">
                        {foreach from=$smarty.session.sys_router key=index item=item}
                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1775 editable-act"  data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-{$page->section}-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                            <a href="/backend/{if $item->style eq 'shop'}shop/{/if}{$item->page}" data-apply-href="{$item->id}">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <h2 data-apply-id="{$item->id}" data-edit-type="title" class="h2menu">{$item->title}</h2>
                            </a>
                            <input type="hidden" data-id="{$item->id}" data-edit-type="custom" value="router" />
                            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1" data-apply-text="{$item->id}">{$item->page}</textarea>
                        </li>
                        {/foreach}
                    </ul>
                    {/if}
                </li>
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8350">
                    <a href="https://www.youtube.com/watch?v=TYS1-Hq2eBA">
                        <i class="fa fa-video-camera"></i>
                        VIDEO LIVESTREAM
                    </a>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2517">
                    <a href="/backend/huong-dan-mua-hang">
                        <i class="fa fa-arrow-circle-right"></i>
                        CÁCH MUA HÀNG
                    </a>
                </li>
            </ul>
        </div>

        <!-- /sidebar-inner -->

        <!-- /sidebar -->
    </div>
    <!-- /ZALO -->
    <!--
    <div class='support-online'>
        <div class='support-img'><img src="/static/frontend/images/zaloicon.jpg" alt="Zalo Trùm Giá Sỉ" height="30" width="30"></div>
        <div class='support-phone'><a href="tel://0932642505">0932.642.505</a></div>
    </div>
    <div class='support-online'>
        <div class='support-img'><img src="/static/frontend/images/zaloicon.jpg" alt="Zalo Trùm Giá Sỉ" height="30" width="30"></div>
        <div class='support-phone'><a href="tel://0979493123">0979.493.123</a></div>
    </div>
    <div class='support-online'>
        <div class='support-img'><img src="/static/frontend/images/phone-icon.jpg" alt="SĐT Trùm Giá Sỉ" height="30" width="30"></div>
        <div class='support-phone'><a href="tel://0919705086">0919.7050.86</a></div>
    </div>
    <div class='support-online'>
        <div class='support-img'><img src="/static/frontend/images/fbicon.jpg" alt="Facebook Trùm Giá Sỉ" height="30" width="30"></div>
        <div class='support-phone'><a href="https://www.facebook.com/trumgiasishop/" target="_blank">FACEBOOK</a></div>
    </div>
    -->
    {foreach from=$metacontact key=index item=item}
        <div class='support-online editable-act' data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-99-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
            <div class='support-img prevent_click'>
                <img data-id="{$item->id}" data-edit-type="photo" src="{$item->photo}" alt="{$item->title}" height="30" width="30">
            </div>
            <div class='support-phone prevent_click'>
                <a data-apply-id="{$item->id}" data-edit-type="des" href="{$item->detail}" target="_blank">{$item->des}</a>
            </div>
            <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="des" data-only-text="1">{$item->des}</textarea>
            <textarea class="prevent_show" data-id="{$item->id}" data-edit-type="detail" data-only-text="1">{$item->detail}</textarea>
        </div>
    {/foreach}
    {literal}
        <style>
            .support-online {height: 30px;border: 1px solid #ccc;margin: 10px;}
            .support-img {float: left;}
            .support-phone a {width: 80%;float: left;line-height: 30px;font-size: 18px;font-family: sans-serif;text-align: center; font-family: "Roboto Condensed", Helvetica, Arial, sans-serif;}
        </style>
    {/literal}
    <!-- /ZALO -->
</div>