function packTheContactForm(e) {
    var t = 100 / 70,
        a = e.width() / e.height(),
        i = e.outerWidth() + 10,
        s = parseInt(e.height() * a / t),
        n = jQuery(".contact-blocks-env");
    n.height(n.height()), TweenLite.to(e, .5, {
        css: {
            height: s
        },
        onComplete: function() {
            resizeEmailIcon(i, s, e);
            var t = new TimelineLite;
            t.append(TweenLite.to(e, .2, {
                css: {
                    scale: .8
                },
                delay: 1.5
            })), t.append(TweenLite.to(e, .5, {
                css: {
                    left: 200,
                    autoAlpha: 0
                },
                ease: Back.easeIn,
                onComplete: function() {
                    TweenLite.to(e, .5, {
                        css: {
                            height: 0
                        }
                    }), setTimeout(function() {
                        jQuery(".contact-form-block .success-message").slideDown("normal")
                    }, 500)
                }
            }))
        }
    })
}

function resizeEmailIcon(e, t, a) {
    var i = jQuery(".mail-sent"),
        s = i.find(".mail-left"),
        n = i.find(".mail-right"),
        o = i.find(".mail-top"),
        r = i.find(".mail-bottom"),
        l = 5;
    i.css({
        width: e,
        height: t
    }), i.fadeIn(300, function() {
        i.addClass("visible")
    });
    var c = t / 2 - l,
        d = e / 2 - l,
        u = e / 2;
    s.css("border-width", c + "px 0 " + c + "px " + c + "px"), n.css("border-width", c + "px " + c + "px " + c + "px 0"), o.css("border-width", d + "px " + d + "px 0" + d + "px"), r.css("border-width", "0 " + u + "px " + u + "px " + u + "px")
}

function setupCollapsedSidebarMenu() {
    var e = jQuery,
        t = public_vars.$sidebarMenu.find("> .nav"),
        a = t.find("> li:has(ul)"),
        i = .35,
        s = Quad.easeInOut;
    odd_len = 100, even_len = 200, opacity_class = "opacity-hidden", calculateMenuHeights(a), t.find("li:has(ul):not(.current-menu-ancestor)").each(function(t, a) {
        var n = e(a),
            o = n.children("ul"),
            r = n.data("height"),
            l = o.find("> li:odd"),
            c = o.find("> li:even"),
            d = 0,
            u = 0;
        o.find("> li").addClass(opacity_class), n.hoverIntent({
            over: function() {
                window.clearTimeout(d), window.clearTimeout(u), d = setTimeout(function() {
                    l.removeClass(opacity_class)
                }, 1e3 * i - odd_len), u = setTimeout(function() {
                    c.removeClass(opacity_class)
                }, 1e3 * i - even_len), TweenLite.to(o, i, {
                    css: {
                        height: r
                    },
                    ease: s,
                    onComplete: function() {
                        o.css({
                            height: "auto"
                        })
                    }
                })
            },
            out: function() {
                window.clearTimeout(d), window.clearTimeout(u), d = setTimeout(function() {
                    l.addClass(opacity_class)
                }, odd_len), u = setTimeout(function() {
                    c.addClass(opacity_class)
                }, even_len), TweenLite.to(o, i, {
                    css: {
                        height: 0
                    },
                    delay: Math.max(odd_len, even_len) / 1e3 + i / 2,
                    ease: s
                })
            },
            timeout: 100
        })
    }), t.find(".current_page_ancestor:has(ul)").each(function(t, a) {
        var i = e(a),
            s = i.children("ul");
        s.find("li").removeClass(opacity_class), s.css({
            height: "auto"
        })
    })
}

function calculateMenuHeights(e) {
    var t = jQuery;
    e.each(function(e, a) {
        var i = t(a),
            s = i.children("ul");
        s.css({
            display: "block",
            height: "auto"
        });
        var n = s.outerHeight(!0);
        i.data("height", n), s.find("> li:has(ul)").length && calculateMenuHeights(s.find("> li"))
    }), e.find("> ul").removeAttr("style").css({
        display: "block",
        height: 0
    })
}

function validateEmail(e) {
    var t = /^[a-zA-Z0-9._]+[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z\.]{2,}$/;
    return t.test(e)
}

function updateCartItemsNumber(e) {
    var t = public_vars.$cartRibbon.find(".bucket"),
        a = public_vars.$cartRibbon.find(".number").add(public_vars.$mobileMenu.find(".cart-items span")),
        i = parseInt(public_vars.$cartRibbon.css("padding-top"), 10);
    TweenLite.to(public_vars.$cartRibbon, .2, {
        css: {
            paddingTop: 1.5 * i
        }
    }), TweenLite.to(public_vars.$cartRibbon, .1, {
        css: {
            paddingTop: i
        },
        delay: .2
    }), TweenLite.to(a, .2, {
        css: {
            scale: .4
        },
        onComplete: function() {
            a.html(e), TweenLite.to(a, .2, {
                css: {
                    scale: 1
                }
            });
            var i = .2;
            TweenLite.to(t, i, {
                css: {
                    transform: "rotate(5deg)"
                }
            }), TweenLite.to(t, i, {
                css: {
                    transform: "rotate(-5deg)"
                },
                delay: 1 * i
            }), TweenLite.to(t, i, {
                css: {
                    transform: "rotate(0)"
                },
                delay: 2 * i
            })
        }
    })
}

function updateHeaderCart(e, t) {
    var a = public_vars.$cartItems.data("owlCarousel");
    "object" == typeof a ? (a.destroy(), public_vars.$cartItems.hide(), TweenLite.to(public_vars.$cartItems, .1, {
        css: {
            autoAlpha: 0
        },
        onComplete: function() {
            public_vars.$cartItems.html(t), public_vars.$cartItems.show(), public_vars.$cartItems.owlCarousel({
                items: 4,
                navigation: !0,
                pagination: !1
            }), TweenLite.to(public_vars.$cartItems, .2, {
                css: {
                    autoAlpha: 1
                }
            })
        }
    })) : jQuery.isFunction(jQuery.fn.owlCarousel) && (public_vars.$cartItems.html(t), public_vars.$cartItems.owlCarousel({
        items: 4,
        navigation: !0,
        pagination: !1
    })), TweenLite.to(public_vars.$cartSubTotal, .3, {
        css: {
            autoAlpha: 0
        },
        onComplete: function() {
            public_vars.$cartSubTotal.html(e), TweenLite.to(public_vars.$cartSubTotal, .3, {
                css: {
                    autoAlpha: 1
                }
            })
        }
    })
}

function updateShippingMethods(e) {
    if ("undefined" != typeof wc_cart_params) {
        var t = {
            action: "laborator_update_shipping_method",
            security: wc_cart_params.update_shipping_method_nonce,
            shipping_method: [e]
        };
        jQuery(".cart-totals").addClass("is-loading"), jQuery.post(ajaxurl, t, function(e) {
            jQuery(".cart-totals").removeClass("is-loading"), jQuery(".cart-totals .subtotal .value").html(e.subtotal), jQuery(".cart-totals .total .value").html(e.total), jQuery(".cart-totals .tax-rate .value").html(e.vat_total)
        }, "json")
    } else if ("undefined" != typeof wc_checkout_params) {
        var a, i, s, n, o, r, l = jQuery,
            c = l("#order_review input[name=payment_method]:checked").val(),
            d = l("#billing_country").val(),
            u = l("#billing_state").val(),
            p = l("input#billing_postcode").val(),
            h = l("#billing_city").val(),
            v = l("input#billing_address_1").val(),
            f = l("input#billing_address_2").val();
        l("#ship-to-different-address input").is(":checked") || 0 === l("#ship-to-different-address input").size() ? (a = l("#shipping_country").val(), i = l("#shipping_state").val(), s = l("input#shipping_postcode").val(), n = l("#shipping_city").val(), o = l("input#shipping_address_1").val(), r = l("input#shipping_address_2").val()) : (a = d, i = u, s = p, n = h, o = v, r = f);
        var t = {
            action: "laborator_update_order_review",
            security: wc_checkout_params.update_order_review_nonce,
            shipping_method: [e],
            payment_method: c,
            country: d,
            state: u,
            postcode: p,
            city: h,
            address: v,
            address_2: f,
            s_country: a,
            s_state: i,
            s_postcode: s,
            s_city: n,
            s_address: o,
            s_address_2: r,
            post_data: l("form.checkout").serialize()
        };
        jQuery(".cart-totals").addClass("is-loading"), xhr = l.ajax({
            type: "POST",
            dataType: "json",
            url: wc_checkout_params.ajax_url,
            data: t,
            success: function(e) {
                e && (jQuery(".cart-totals").removeClass("is-loading"), jQuery(".cart-totals .cart-subtotal .value").html(e.subtotal), jQuery(".cart-totals .order-total .value").html(e.total), jQuery(".cart-totals .tax-rate .value").html(e.vat_total), l("body").trigger("updated_checkout"))
            }
        })
    }
}

function launchFullscreen(e) {
    e.requestFullscreen ? e.requestFullscreen() : e.mozRequestFullScreen ? e.mozRequestFullScreen() : e.webkitRequestFullscreen ? e.webkitRequestFullscreen() : e.msRequestFullscreen && e.msRequestFullscreen()
}

function exitFullscreen() {
    document.exitFullscreen ? document.exitFullscreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitExitFullscreen && document.webkitExitFullscreen()
}

function forceFullWidth(e) {
    e.css({
        marginLeft: "",
        width: ""
    });
    var t = e.offset().left;
    e.css({
        width: jQuery(document).width(),
        marginLeft: -t
    }), jQuery(window).on("lab.resize", function() {
        forceFullWidth(e)
    })
}

function setupStickMenu() {
    var e = jQuery,
        t = public_vars.$body.hasClass("ht-1") ? 1 : public_vars.$body.hasClass("ht-2") ? 2 : 3;
    if (!(jQuery(window).height() > public_vars.$body.outerHeight() - 200 || public_vars.$body.outerHeight() < 1.2 * jQuery(window).height())) {
        if (2 == t) {
            var a = public_vars.$body.find(".top-menu"),
                i = public_vars.$body.find(".main-menu-top"),
                s = e("<div></div>"),
                n = public_vars.$body.hasClass("admin-bar") ? 32 : 0;
            if (!a.length) return;
            var o = scrollMonitor.create(a, -n);
            o.lock(), a.after(s);
            var r = public_vars.$stickyLogo.next().innerHeight();
            public_vars.$stickyLogo.css({
                display: "block"
            }).data("width", public_vars.$stickyLogo.innerWidth()).css({
                width: 0,
                lineHeight: r + "px"
            }), public_vars.$stickyLogo.hasClass("image-logo") && public_vars.$stickyLogo.data("width", 0).find("img").css({
                maxHeight: r - 30
            }), i.css({
                top: n
            }), o.exitViewport(function() {
                isxs() || (a.hide(), s.height(a.height() + i.outerHeight(!0)), i.addClass("sticky"), TweenLite.to(public_vars.$stickyLogo, .3, {
                    css: {
                        width: public_vars.$stickyLogo.data("width"),
                        autoAlpha: 1
                    }
                }))
            }), o.enterViewport(function() {
                isxs() || (a.attr("style", ""), s.height(0), i.removeClass("sticky"), TweenLite.to(public_vars.$stickyLogo, .3, {
                    css: {
                        width: 0,
                        autoAlpha: 0
                    }
                }))
            }), e(window).load(function() {
                if (public_vars.$stickyLogo.hasClass("image-logo")) public_vars.$stickyLogo.css({
                    width: ""
                }).data("width", public_vars.$stickyLogo.width()).css({
                    width: 0
                });
                else {
                    var e = public_vars.$stickyLogo.data("width");
                    public_vars.$stickyLogo.css({
                        width: ""
                    }).data("width", public_vars.$stickyLogo.width()).css("width", 0), i.hasClass("sticky") && public_vars.$stickyLogo.css({
                        width: e
                    })
                }
                i.hasClass("sticky") && TweenLite.to(public_vars.$stickyLogo, .3, {
                    css: {
                        width: public_vars.$stickyLogo.data("width"),
                        autoAlpha: 1
                    }
                })
            })
        }
        if (3 == t) {
            var a = public_vars.$body.find(".top-menu"),
                l = a.find(".sec-nav-menu"),
                s = e('<div class="header-menu-spacer"></div>'),
                n = public_vars.$body.hasClass("admin-bar") ? 32 : 0;
            if (tm_out = 0, a.length) {
                var o = scrollMonitor.create(a, -n);
                o.lock(), a.after(s);
                var r = public_vars.$stickyLogo.next().innerHeight();
                return o.exitViewport(function() {
                    isxs() || (s.height(a.outerHeight() + 20), a.addClass("sticky-header").removeClass("is-hidden show-header"), window.clearTimeout(tm_out), tm_out = setTimeout(function() {
                        a.addClass("visible"), l.addClass("hidden")
                    }, 100))
                }), void o.fullyEnterViewport(function(e) {
                    !isxs() && e && (a.addClass("not-visible"), setTimeout(function() {
                        s.height(0), a.removeClass("sticky-header visible").addClass("is-hidden"), l.removeClass("hidden"), l.next().removeClass("hidden"), tm_out && window.clearTimeout(tm_out), tm_out = setTimeout(function() {
                            a.addClass("show-header")
                        }, 50), setTimeout(function() {
                            a.addClass("not-visible-finished")
                        }, 150)
                    }, 150))
                })
            }
        }
        if (3 == t) {
            a = public_vars.$body.find(".top-menu-centered");
            var c = a.find(".navs");
            if (a.length && c.length) {
                c.before(s);
                var d = scrollMonitor.create(c, {
                    top: n
                });
                d.lock(), d.partiallyExitViewport(function() {
                    c.offset().left, c.width();
                    c.addClass("is-fixed").css({
                        width: "auto"
                    }), s.height(c.outerHeight())
                }), d.fullyEnterViewport(function() {
                    c.removeClass("is-fixed"), s.removeAttr("style")
                })
            }
        }
    }
}
var public_vars = public_vars || {};
! function(e, t, a) {
    "use strict";
    e(document).ready(function() {
        public_vars.$body = e("body"), public_vars.$mainSidebar = e(".main-sidebar"), public_vars.$sidebarMenu = public_vars.$mainSidebar.find(".sidebar-menu"), public_vars.$cartRibbon = public_vars.$body.find(".cart-ribbon .cart_content"), public_vars.$headerCart = public_vars.$body.find(".header-cart"), public_vars.$cartSubTotal = public_vars.$headerCart.find(".cart-sub-total .amount"), public_vars.$cartItems = public_vars.$headerCart.find(".cart-items"), public_vars.$topMainMenu = public_vars.$body.find(".main-menu-env li:has(> ul)"), public_vars.$mobileMenu = public_vars.$body.find(".mobile-menu"), public_vars.$stickyLogo = public_vars.$body.find(".logo-sticky"), e.isFunction(e.fn.perfectScrollbar) && public_vars.$mainSidebar.perfectScrollbar(), public_vars.$sidebarMenu.hasClass("collapsed-subs") && setupCollapsedSidebarMenu(), e.extend(public_vars, {
            hoverIndex: 100,
            mainTopMenuFall: 15,
            mainTopMenuDuration: .3
        }), 0 == public_vars.$body.find(".main-menu-env .megaMenuContainer").length && public_vars.$topMainMenu.each(function(t, a) {
            var i = e(a),
                s = i.find("> ul"),
                n = "UL" == i.parent().parent().parent()[0].tagName;
            n ? TweenLite.set(s, {
                css: {
                    x: -public_vars.mainTopMenuFall,
                    y: 0
                }
            }) : TweenLite.set(s, {
                css: {
                    y: public_vars.mainTopMenuFall
                }
            }), i.hoverIntent({
                over: function() {
                    public_vars.hoverIndex++, i.css({
                        overflow: "visible"
                    }), s.css({
                        zIndex: public_vars.hoverIndex
                    }), n ? TweenLite.to(s, public_vars.mainTopMenuDuration, {
                        css: {
                            x: 0,
                            autoAlpha: 1
                        }
                    }) : TweenLite.to(s, public_vars.mainTopMenuDuration, {
                        css: {
                            y: 0,
                            autoAlpha: 1
                        }
                    })
                },
                out: function() {
                    s.css({
                        zIndex: public_vars.hoverIndex
                    }), n ? TweenLite.to(s, public_vars.mainTopMenuDuration, {
                        css: {
                            x: -public_vars.mainTopMenuFall,
                            autoAlpha: 0
                        },
                        onComplete: function() {
                            i.css({
                                overflow: "hidden"
                            })
                        }
                    }) : TweenLite.to(s, public_vars.mainTopMenuDuration, {
                        css: {
                            y: public_vars.mainTopMenuFall,
                            autoAlpha: 0
                        },
                        onComplete: function() {
                            i.css({
                                overflow: "hidden"
                            })
                        }
                    })
                },
                timeout: 200
            })
        }), e(".autogrow").autoGrow();
        var a = [],
            i = function() {
                if (a.length) {
                    var e = a.shift(),
                        t = new Image;
                    t.src = e.src, t.onload = function() {
                        e.$el.hasClass("lab-lazy-load") && e.$el.attr("src", e.src).removeClass("lab-lazy-load"), i()
                    }
                }
            };
        if (e("img:not(.lab-lazy-load):visible").each(function(t, i) {
            var s = e(i),
                n = s.attr("src");
            a.push({
                i: t,
                src: n,
                $el: s
            })
        }), e("img.lab-lazy-load").each(function(t, i) {
            var s = e(i),
                n = s.data("src");
            a.push({
                i: t,
                src: n,
                $el: s
            })
        }), e(t).load(i), e.isFunction(e.fn.nivoLightbox) && e(".nivo a, .post_details .post-content a").nivoLightbox({
            effect: "fade",
            theme: "default"
        }), e.isFunction(e.fn.cycle)) {
            var s = e(".post-imgs-slider");
            e.fn.cycle.log = function() {}, imagesLoaded(s.get(0), function() {
                s.find(".loading").remove(), s.find("> a.hidden").removeClass("hidden"), s.cycle({
                    slides: "> a",
                    prev: s.find(".pager .prev"),
                    next: s.find(".pager .next"),
                    log: function() {}
                })
            })
        }
        var n = e(".contact-form");
        if (n.length && n.find("form").length) {
            var o = n.find("form");
            n.find("h4");
            o.submit(function(t) {
                t.preventDefault();
                var a = o.serializeArray(),
                    i = o.find('[data-required="1"]');
                if (i.length) {
                    var s = i.serializeArray(),
                        r = [];
                    for (var l in s) r.push(s[l].name)
                }
                for (var l in a.reverse()) {
                    var c = a[l],
                        d = o.find('[name="' + c.name + '"]'); - 1 != e.inArray(c.name, r) && ("" == e.trim(d.val()) ? d.addClass("has-errors").focus() : d.removeClass("has-errors")), "email" == c.name && d.val().length && (validateEmail(d.val()) ? d.removeClass("has-errors") : d.addClass("has-errors").focus())
                }
                o.find(".has-errors").length || n.hasClass("is-loading") || n.data("is-done") || (a.push({
                    name: "action",
                    value: "cf_process"
                }), a.push({
                    name: "verify",
                    value: o.data("check")
                }), a.push({
                    name: "id",
                    value: o.data("id")
                }), n.addClass("is-loading"), e.post(ajaxurl, a, function(e) {
                    if (e.success) {
                        var t = n.find(".success-message");
                        t.show(), n.removeClass("is-loading"), n.data("is-done", 1), n.find("[name]").fadeTo(200, .6).attr("readonly", !0), packTheContactForm(n)
                    } else alert("An error occured your message cannot be send!")
                }, "json"))
            })
        }
        e.isFunction(e.fn.tooltip) && e('a[data-toggle="tooltip"], span[data-toggle="tooltip"]').tooltip({}), e(".product.has-gallery").each(function(t, a) {
            var i = e(a),
                s = i.find(".image.full-gallery .thumb img");
            if (s.length > 1) {
                i.find(".image").append('<a href="#" class="thumb-prev">Prev</a><a href="#" class="thumb-next">Next</a>');
                var n = i.find(".thumb-prev, .thumb-next");
                n.on("click", function(t) {
                    t.preventDefault();
                    var a = e(this).hasClass("thumb-prev") ? -1 : 1,
                        i = s.filter(":not(.hidden-slowly)"),
                        n = i.next();
                    1 == a ? 0 == n.length && (n = s.first()) : (n = i.prev(), 0 == n.length && (n = s.last())), n.addClass("enter-in notrans " + (-1 == a ? "ei-left" : "")).removeClass("hidden hidden-slowly hs-left hs-right"), i.addClass("hidden-slowly " + (-1 == a ? "hs-left" : "")), setTimeout(function() {
                        n.removeClass("enter-in notrans ei-left")
                    }, 0)
                })
            }
        }), e(".product .add-to-cart[data-id]").each(function(t, a) {
            var i = e(a),
                s = i.closest(".product");
            i.on("click", function(t) {
                if (t.preventDefault(), !i.hasClass("added")) {
                    s.addClass("is-loading"), i.tooltip("hide");
                    var a = {
                        action: "lab_add_to_cart",
                        product_id: i.data("id")
                    };
                    e.post(ajaxurl, a, function(t) {
                        if (s.removeClass("is-loading"), t.success) i.addClass("added").tooltip("destroy"), updateCartItemsNumber(t.cart_items), updateHeaderCart(t.cart_subtotal, t.cart_html), setTimeout(function() {
                            i.removeClass("added"), i.tooltip()
                        }, 1500), e(document).trigger("added_to_cart", [i, t.cart_html]), e(".widget_shopping_cart").show(), e(".widget_shopping_cart_content").html(t.cart_html_frag);
                        else {
                            var a = s.find(".error-container");
                            s.addClass("has-errors"), a.html(""), e.each(t.error_msg, function(t, i) {
                                a.html(e("<span>").html(i))
                            }), setTimeout(function() {
                                s.removeClass("has-errors")
                            }, 2e3)
                        }
                    }, "json")
                }
            })
        }), public_vars.$cartRibbon.closest(".cart-ribbon").on("click", function(a) {
            a.preventDefault(), public_vars.$body.hasClass("header-cart-open") ? public_vars.$headerCart.slideUp("normal", function() {
                public_vars.$body.removeClass("header-cart-open")
            }) : (public_vars.$headerCart.slideDown(function() {
                e(t).on("click", r)
            }), public_vars.$body.addClass("header-cart-open"))
        });
        var r = function(a) {
            public_vars.$headerCart.is(":visible") && (e(a.target).closest(".header-cart").length || (e(t).off("click", r), public_vars.$headerCart.slideUp("normal", function() {
                public_vars.$body.removeClass("header-cart-open")
            })))
        };
        /*e(".cart-totals #shipping_method input").on("change", function() {
            var t = e(this).val();
            updateShippingMethods(t)
        }), e(".cart-totals select.shipping_method").on("change", function() {
            var t = e(this).val();
            updateShippingMethods(t)
        }), e("body").on("updated_checkout", function() {
            e.isFunction(e.fn.iCheck) && e('input[type="checkbox"], input[type="radio"]').each(function(t, a) {
                !e(a).data("iCheck")
            })
        });*/
        var l = e(".myaccount-env .myaccount-tabs li > a");
        l.each(function(a, i) {
            var s = e(i);
            if (s.attr("href").match(/^\#/)) {
                var n = e(".myaccount-tab" + s.attr("href"));
                t.location.hash.toString() == s.attr("href") && setTimeout(function() {
                    n.length || (n = e(".myaccount-tab" + s.attr("href")));
                    var t = e(".myaccount-tab").not(n);
                    t.hide(), n.show(), l.parent().removeClass("active"), s.parent().addClass("active")
                }, 1), s.on("click", function(a) {
                    a.preventDefault(), n.length || (n = e(".myaccount-tab" + s.attr("href")));
                    var i = e(".myaccount-tab").not(n);
                    i.hide(), n.fadeIn(300), l.parent().removeClass("active"), s.parent().addClass("active");
                    var o = e(t).scrollTop();
                    t.location.hash = s.attr("href").replace("#", ""), e(t).scrollTop(o)
                })
            }
        });
        var c = e(".product-single .variations select, select.oxy-list");
        c.each(function(t, a) {
            var i = e(a);
            i.css({
                width: "100%"
            }).wrap(e('<div class="select-wrapper" />'));
            var s = i.parent(),
                n = e('<span class="select-placeholder" />');
            s.prepend(n), s.prepend('<div class="select-arrow" />'), n.html(i.find("option:selected").html()), i.on("change", function(e) {
                n.html(i.find("option:selected").html())
            })
        });
        var d = e("#laborator-rating");
        if (d.length) {
            var u = e('<div class="rating" />');
            d.hide().after(u), e(d.find("option").get().reverse()).each(function(t, a) {
                var i = e(a),
                    s = 5 - t;
                i.attr("value").match(/[0-9]+/) && u.prepend('<a href="#" data-rating="' + s + '" class="glyphicon glyphicon-star star-' + s + '"></a>')
            }), u.data("current-rating", 0), u.on("click", "a", function(t) {
                t.preventDefault();
                var a = e(this),
                    i = a.data("rating");
                d.find("option").attr("selected", !1), u.data("current-rating") == i ? (u.attr("class", "rating"), u.data("current-rating", 0)) : (u.attr("class", "rating filled-" + i), u.data("current-rating", i), d.find('option[value="' + i + '"]').attr("selected", !0))
            }).on("mouseover", "a", function(t) {
                u.removeClass("hover-1 hover-2 hover-3 hover-4 hover-5").addClass("hover-" + e(this).data("rating"))
            }).on("mouseout", "a", function(e) {
                u.removeClass("hover-1 hover-2 hover-3 hover-4 hover-5")
            })
        }
        if ("undefined" != typeof CBPGridGallery) {
            var p = e(".laborator-woocommerce .shop-grid");
            p.each(function(e, t) {
                new CBPGridGallery(t)
            })
        }
        var h = (e(".yith-add-to-wishlist"), e(null));
        e("body").on("click", ".yith-add-to-wishlist", function() {
            h = e(this)
        }), e("body").on("added_to_wishlist", function(e, t) {
            h.removeClass("is-loading"), h.parent().addClass("wishlisted")
        }), e(".yith-add-to-wishlist").each(function(t, a) {
            e(a).on("click", function(t) {
                t.preventDefault(), e(a).addClass("is-loading")
            })
        }), e(t).bind("cbpOpen", function(t, a, i) {
            var s = e(i.currentItem),
                n = s.data("owlCarousel");
            n || s.find(".product-gallery").owlCarousel({
                items: 1,
                navigation: !0,
                pagination: !1,
                singleItem: !0,
                slideSpeed: 400,
                beforeInit: function() {
                    var e = s.find(".product-gallery .hidden");
                    e.length > 0 && (e.closest(".product-gallery-env").addClass("has-gallery"), e.removeClass("hidden"))
                }
            })
        });
        var v = e(".main-menu-top .search-form, .top-menu-centered .search-form");
        if (v.length) {
            var f = v.find(".search-input-env"),
                m = f.find("input"),
                b = f.val();
            v.on("click", "a", function(e) {
                return e.preventDefault(), m.val().length > 0 && b != f.val() ? void v.submit() : (m.val().length && !f.is(":visible") && b != f.val() && v.submit(), f.toggleClass("visible"), void(f.hasClass("visible") && setTimeout(function() {
                    m.focus()
                }, 100)))
            }), m.on("blur", function() {
                f.removeClass("visible")
            })
        }
        "undefined" != typeof WOW && setTimeout(function() {
            (new WOW).init()
        }, 500), e(".vc_separator.one-line-border, .vc_separator.double-bordered, .vc_separator.double-bordered-thin, .vc_separator.double-bordered-thick").each(function(t, a) {
            var i, s = e(a),
                n = s.attr("class");
            (i = n.match(/custom-color-([a-f0-9]+)/)) && (s.find(".vc_sep_line").css({
                borderColor: "#" + i[1]
            }), s.hasClass("one-line-border") && s.find("h4").css({
                borderColor: "#" + i[1]
            })), (i = n.match(/__(.*?)__/i)) && s.find("h4").append("<span>" + i[1].replace(/-/g, " ") + "</span>")
        });
        var _ = 300,
            g = function() {
                public_vars.$mobileMenu.addClass("visible-xs").removeClass("hidden").attr("style", "display: block !important").data("height", public_vars.$mobileMenu.outerHeight()), public_vars.$mobileMenu.find(".menu-item-has-children").each(function(t, a) {
                    var i = e(a),
                        s = i.find("> ul");
                    s.attr("style", "display: block !important").data("height", s.outerHeight()).attr("style", "height: 0px; display: block")
                }), public_vars.$mobileMenu.attr("style", "height: 0px")
            };
        public_vars.$body.find(".mobile-menu-link > a").on("click", function(t) {
            t.preventDefault();
            var a = e(this);
            if (a.hasClass("opened")) {
                a.removeClass("opened");
                var i = public_vars.$mobileMenu.find("li.visible");
                public_vars.$mobileMenu.add(i).removeClass("visible"), TweenLite.to(public_vars.$mobileMenu, _ / 1e3, {
                    css: {
                        height: 0
                    },
                    delay: _ / 2 / 1e3,
                    onComplete: function() {
                        i.find("> ul").height(0).removeClass("visible"), i.find(".expand").removeClass("expanded")
                    }
                })
            } else a.addClass("opened"), setTimeout(function() {
                public_vars.$mobileMenu.addClass("visible")
            }, _ / 2), TweenLite.to(public_vars.$mobileMenu, _ / 1e3, {
                css: {
                    height: public_vars.$mobileMenu.data("height")
                },
                ease: Power2.easeInOut,
                onComplete: function() {
                    public_vars.$mobileMenu.height("")
                }
            })
        }), public_vars.$mobileMenu.find(".menu-item-has-children").each(function(t, a) {
            var i = e(a),
                s = e('<span class="expand"><i class="entypo-plus"></i></span>'),
                n = i.find("> ul");
            i.find("> a").prepend(s), s.on("click", function(e) {
                if (e.preventDefault(), s.hasClass("expanded")) {
                    s.removeClass("expanded");
                    var t = n.add(n.find("ul"));
                    t.parent().removeClass("visible"), TweenLite.to(t, _ / 1e3, {
                        css: {
                            height: 0
                        },
                        delay: _ / 2 / 1e3,
                        onComplete: function() {
                            t.find(".expand").removeClass("expanded")
                        }
                    })
                } else s.addClass("expanded"), setTimeout(function() {
                    i.addClass("visible")
                }, _ / 2), TweenLite.to(n, _ / 1e3, {
                    css: {
                        height: n.data("height")
                    },
                    onComplete: function() {
                        n.height("")
                    }
                })
            })
        }), g(), public_vars.$body.hasClass("sticky-menu") && setupStickMenu(), e(".lab_wpb_testimonials").each(function(a, i) {
            var s = e(i),
                n = s.find(".testimonials-inner"),
                o = s.find(".testimonial-entry"),
                r = o.filter(".hidden"),
                l = s.data("autoswitch"),
                c = e('<div class="testimonials-nav">'),
                d = 0;
            if (o.eq(d).addClass("current"), r.removeClass("hidden").hide(), o.length > 1) {
                for (var a = 0; a < o.length; a++) c.append('<a href="#"' + (a == d ? ' class="active"' : "") + ' data-index="' + a + '">' + (a + 1) + "</a>");
                n.append(c)
            }
            var u = function(e) {
                if (d != e) {
                    e %= o.length;
                    var t = o.filter(".current"),
                        a = o.eq(e);
                    a.show(), t.hide();
                    var i = a.outerHeight(!0) + c.outerHeight();
                    t.show(), a.hide(), c.find("a").removeClass("active").eq(e).addClass("active"), TweenLite.to(t, .15, {
                        css: {
                            autoAlpha: 0
                        },
                        onComplete: function() {
                            t.attr("style", "").removeClass("current").hide(), a.show().addClass("current"), TweenLite.set(a, {
                                css: {
                                    autoAlpha: 0
                                }
                            }), TweenLite.to(a, .35, {
                                css: {
                                    autoAlpha: 1
                                },
                                onComplete: function() {
                                    d = e
                                }
                            })
                        }
                    }), TweenLite.to(n, .3, {
                        css: {
                            height: i
                        },
                        onComplete: function() {
                            n.attr("style", "")
                        }
                    })
                }
            };
            if (c.on("click", "a", function(t) {
                t.preventDefault(), u(parseInt(e(this).data("index"), 10))
            }), l > 0) {
                var p = 0,
                    h = function(e) {
                        t.clearTimeout(p), e && (p = setTimeout(function() {
                            u(d + 1), h(1)
                        }, 1e3 * l))
                    };
                s.on("mouseover", function() {
                    h()
                }).on("mouseleave", function() {
                    h(!0)
                }), h(!0)
            }
        });
        var y = e(".cart-ribbon[data-ajax-counter]");
        /*y.length && e.post(ajaxurl, {
            action: "lab_get_cart_info"
        }, function(e) {
            y.find(".number").html(e.count), updateHeaderCart(e.cart_subtotal, e.cart_html), 0 == e.count && public_vars.$cartItems.html(e.cart_html)
        }, "json");*/
        var w = e(".commission-rates, .my-commissions, .payment-details");
        if (3 == w.length) {
            w.wrapAll('<div class="myaccount-tab" id="comission-king"></div>'), w.find("table").addClass("table"), w.find('input[type="text"], textarea').addClass("form-control"), w.find(".button").addClass("btn btn-default");
            var C = w.find(".button[onclick]");
            C.parent().before(C)
        }
        var $ = function() {
            e(".quantity").each(function(t, a) {
                var i = e(a),
                    s = i.find(".qty");
                i.hasClass("buttons_added") || (i.addClass("buttons_added"), s.before('<input type="button" value="-" class="plusminus minus">'), s.after('<input type="button" value="+" class="plusminus plus">'))
            })
        };
        $(), e("body").on("click", 'input[type="button"].plusminus', function() {
            var t = e(this),
                a = t.prev(),
                i = 1;
            t.hasClass("minus") && (a = t.next(), i = -1);
            var s = parseInt(a.val(), 10) + i;
            0 > s && (s = 0), a.val(s)
        }), e("#yith-wcwl-form .show-title-form").on("click", function(t) {
            t.preventDefault(), e(this).next().slideToggle("fast", function() {
                e(this).parent().find(".form-control ").focus()
            })
        }), e(".mobile-menu .search-form>a").on("click", function(t) {
            t.preventDefault(), e(this).closest("form").submit()
        }), e("form.cart").on("submit", function(t) {
            var a = e(this),
                i = a.find(".qty.text"),
                s = 1 == e(".product-type-grouped").length;
            0 == s && i.length && 0 == i.val() && (t.preventDefault(), i.select())
        })
    });
    var i = 0;
    e(t).resize(function() {
        clearTimeout(i), i = setTimeout(trigger_resizable, 200)
    })
}(jQuery, window);