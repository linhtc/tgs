<div class="product-single">

    <div class="row">

        <div class="col-md-12 product-info-env">

            <div itemscope="" itemtype="http://schema.org/Product" id="product-8806" class="post-8806 product type-product status-publish has-post-thumbnail first instock shipping-taxable purchasable product-type-simple">

                <div class="row white-row">

                    <div class="col-sm-6">

                        <div class="product-left-info">

                            <div class="images hidden">
                                <div class="thumbnails"></div>
                            </div>

                            <div class="main-images product-images">

                                <div id="main-image-slider">
                                    <a href="{$product->photo}" itemprop="image" title="{$product->title}" class="woocommerce-main-image zoom" data-lightbox-gallery="main-images">
                                        <img src="{$product->photo}" class="attachment-shop-thumb-4 size-shop-thumb-4" alt="{$product->title}">
                                        <span class="zoom-image"><i class="glyphicon glyphicon-fullscreen"></i></span>
                                    </a>
                                </div>

                                {literal}
                                <script type="text/javascript">
                                    /*jQuery(document).ready(function($) {
                                        var $mis = jQuery("#main-image-slider");

                                        if ($('body').hasClass('nivo-disabled') == false) {
                                            $mis.find(".woocommerce-main-image").nivoLightbox({
                                                effect: 'fadeScale'
                                            });
                                        }
                                    });*/
                                </script>
                                {/literal}
                            </div>

                        </div>

                    </div>

                    <div class="col-sm-6">

                        <div class="summary entry-summary">

                            <h2 itemprop="name" class="product_title entry-title">{$product->title}</h2>

                            <br>

                            <div itemprop="description">
                                {$product->detail}
                            </div>
                            <p class="price in-stock">{$product->des} đ</p>
                            <p class="stock in-stock">Còn hàng</p>
                        </div>
                        <!-- .summary -->

                    </div>

                    <div class="clear"></div>

                </div>

                <meta itemprop="url" content="{$product->url}">

            </div>
            <!-- #product-8806 -->

        </div>

    </div>

</div>