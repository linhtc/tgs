<div class="footer-env">
    <div class="container">
        <footer class="footer_widgets">
            <div class="row">
                <div class="col-sm-4">
                    <div class="footer-block widget_text text-15 editable-act" data-id="{$smarty.session.sys_cnf->cnf_intro->id}">
                        <h3 data-apply-text="{$smarty.session.sys_cnf->cnf_intro->id}" data-edit-type="title">{$smarty.session.sys_cnf->cnf_intro->n}</h3>
                        <div class="textwidget">
                            <span style="font-size: 16px;" data-apply-text="{$smarty.session.sys_cnf->cnf_intro->id}" data-edit-type="detail">{$smarty.session.sys_cnf->cnf_intro->v1}</span>
                            <br/>
                            <p style="
    color: red;
    font-weight: bold !important;
    font-size: 15px !important;
"
                            "><i class="fa fa-map-marker" aria-hidden="true"></i>   75/55 Gò Dầu Tân Quý Tân Phú</p>
                            <p style="color: red; font-weight: bold !important; font-size: 15px !important;"><i class="fa fa-compass" aria-hidden="true"></i>
                            <span>Tìm đường đến shop:</span> <a target="_blank" href="https://goo.gl/maps/krkcEEAXVm62"style="
    color: blue; font-weight: bold !important; font-size: 15px !important;
">XEM BẢN ĐỒ</a>
                            </p>
                            <input type="hidden" data-id="{$smarty.session.sys_cnf->cnf_intro->id}" data-edit-type="title" value="{$smarty.session.sys_cnf->cnf_intro->n}" />
                            <input type="hidden" data-id="{$smarty.session.sys_cnf->cnf_intro->id}" data-edit-type="config" value="1" />
                            <textarea class="prevent_show" data-id="{$smarty.session.sys_cnf->cnf_intro->id}" data-edit-type="detail" data-only-text="1">{$smarty.session.sys_cnf->cnf_intro->v1}</textarea>
                            <br/>
                            <!-- /ZALO -->
                            <!--
                            <div class='support-onlines'>
                                <div class='support-imgs'><a href="tel://0903012994"><img src="/static/frontend/images/zaloicon.jpg" alt="Zalo Trùm Sỉ" height="42" width="42"></a></div>
                            </div>
                            <div class='support-onlines'>
                                <div class='support-imgs'><a href="tel://0903012994"><img src="/static/frontend/images/phone-icon.jpg" alt="SĐT Trùm Sỉ" height="42" width="42"></a></div>
                            </div>
                            <div class='support-onlines'>
                                <div class='support-imgs'><a href="https://www.facebook.com/trumgiasishop/" target="_blank"><img src="/static/frontend/images/fbicon.jpg" alt="Facebook Trùm Giá Sỉ" height="42" width="42"></a></div>
                            </div>
                            -->

                            {foreach from=$metacontact key=index item=item}
                                <div class='support-onlines'>
                                    <div class='support-imgs'>
                                        <a href="{$item->detail}">
                                            <img src="{$item->photo}" alt="{$item->des}" height="42" width="42">
                                        </a>
                                    </div>
                                </div>
                            {/foreach}

                            {literal}
                                <style>
                                    .support-onlines {height: 44px;;float: left;margin-top: 13px;margin-right: 4px;}
                                    .support-imgs {float: left;}
                                </style>
                            {/literal}
                            <!-- /ZALO -->
                            <!--
                            <br/>
                            <a href="//www.dmca.com/Protection/Status.aspx?ID=56094c8f-1b8c-4f70-b49a-3f22678e19d1" title="DMCA.com Protection Status" class="dmca-badge"> <img src="//images.dmca.com/Badges/dmca_protected_16_120.png?ID=56094c8f-1b8c-4f70-b49a-3f22678e19d1" alt="DMCA.com Protection Status"></a> <script src="//images.dmca.com/Badges/DMCABadgeHelper.min.js"> </script>
                            -->
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="footer-block widget_text text-17">
                        <h3>TỪ KHÓA</h3>
                        <div class="textwidget">
                            {foreach from=$metatag key=index item=item}
                                <p class="editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-99-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                    <a class="prevent_click" href="#" data-apply-text="{$item->id}" data-edit-type="title">{$item->title}</a>
                                    <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                </p>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer-block widget_post_views_counter_list_widget post_views_counter_list_widget-3">
                        <h3>BÀI HOT</h3>
                        <ul>
                            {foreach from=$metaarticle key=index item=item}
                                <li class="editable-act" data-id="{$item->id}" data-sort="{$item->sort}" draggable="true" ondragstart="drag(event)" id="item-99-{$item->id}" ondrop="drop(event, this)" ondragover="allowDrop(event)">
                                    <a data-apply-text="{$item->id}" data-edit-type="title" class="post-title" href="{base_url()}tin-tuc/{friendly_url($item->title)}-{$item->id}">{$item->title}</a> <!--<span class="count">(154.657)</span>-->
                                    <input type="hidden" data-id="{$item->id}" data-edit-type="title" value="{$item->title}" />
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                    </div>
        </footer>
        <footer class="footer-container">

            <div class="footer_main row">

                <div class="col-md-12 hidden-sm hidden-xs">
                    <hr class="divider" />
                </div>

                <div class="clear"></div>

                <div class="col-sm-12">

                    <div class="footer-nav">
                        <ul id="menu-footer-menu" class="menu">
                            <li id="menu-item-2424" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-897 current_page_item menu-item-2424"><a href="{base_url()}/">TRÙM SỈ &#8211; NGUỒN HÀNG TIN CẬY</a></li>
                            <li id="menu-item-5345" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-5345"><a href="{base_url()}/shop/">CỬA HÀNG</a></li>
                            <li id="menu-item-2421" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2421"><a href="{base_url()}/noi-bo-si-vay-dam-thiet-ke-quang-chau-tai-tphcm/">GIỚI THIỆU</a></li>
                            <li id="menu-item-2427" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2427"><a href="{base_url()}/kinh-nghiem-ban-hang/">KINH NGHIỆM BÁN HÀNG</a></li>
                            <li id="menu-item-2422" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2422"><a href="{base_url()}/tai-khoan/">TÀI KHOẢN</a></li>
                            <li id="menu-item-2428" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2428"><a href="{base_url()}/cau-hoi-thuong-gap/">CÂU HỎI THƯỜNG GẶP</a></li>
                            <li id="menu-item-2425" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2425"><a href="{base_url()}/huong-dan-mua-hang/">CÁCH MUA HÀNG</a></li>
                            <li id="menu-item-2426" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2426"><a href="{base_url()}/lien-he/">LIÊN HỆ</a></li>
                        </ul>					</div>

                </div>

                <div class="clear"></div>

                <div class="col-sm-12">

                    <div class="copyright_text">
                    </div>

                </div>

            </div>

        </footer>
    </div>
</div>