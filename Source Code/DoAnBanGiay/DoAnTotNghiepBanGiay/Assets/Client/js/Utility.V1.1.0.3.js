$(document).ready(function () {
    $utility.subNavHover();
    $utility.fixNoImage();
    $utility.removeEmptyCat();
    loadOnlineSupport();
    try {
        $('#slider').nivoSlider();
    } catch (e) { };
    try {
        if (!(navigator.userAgent.match(/Android/i)
		 || navigator.userAgent.match(/webOS/i)
		 || navigator.userAgent.match(/iPhone/i)
		 || navigator.userAgent.match(/iPad/i)
		 || navigator.userAgent.match(/iPod/i)
		 || navigator.userAgent.match(/BlackBerry/i)
		 || navigator.userAgent.match(/Windows Phone/i)
		 ) && $(window).width() > 767) {
            $('.jnews').easyTicker({
                direction: 'up',
                height: '301px',
                speed: 'slow',
                interval: 4000
            });
        }
    } catch (e) { }
    try {
        $('.jcarousel3').jcarousel();
    } catch (e) { }
    try {
        $('.jqzoom').jqzoom({
            //zoomType: 'reverse',
            zoomWidth: 450,
            zoomHeight: 400,
            preloadImages: false,
            alwaysOn: false
        });
    } catch (e) { };
    $('.navi-mobile').click(function () {
        $('.navi-root').show();
        var navHeight = $('.navigator').height();
        if (navHeight < 10) {
            navHeight = $('.navigator .navi-root > li').height() * $('.navigator .navi-root > li').length;
            $('.navigator').animate({ 'height': navHeight + 'px' })
        } else {
            $('.navigator').animate({ 'height': '2px' })
            $('.navi-root').slideUp();
        }
    });
    $('.title-list').click(function () {
        $('.navi-left').show();
        var navHeight = $('.category-n').height();
        if (navHeight < 10) {
            navHeight = $('.category-n .navi-left > li').height() * $('.category-n .navi-left > li').length;
            $('.category-n').animate({ 'height': navHeight + 'px' })
        } else {
            $('.category-n').animate({ 'height': '0' });
            $('.navi-left').slideUp();
        }
    });
    loadNaviLeft();
    loadDetailProduct();
    //lightbox
    try {
        $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function (event) {
            event.preventDefault();
            return $(this).ekkoLightbox({
                onShown: function () {
                    if (window.console) {
                        return console.log('Checking our the events huh?');
                    }
                },
                onNavigate: function (direction, itemIndex) {
                    if (window.console) {
                        return console.log('Navigating ' + direction + '. Current item: ' + itemIndex);
                    }
                }
            });
        });
    } catch (e) { };
    if ($(window).width() < 768) {
        $('.cat-news-t').click(function () {
            $('.navi-left').show();
            var navHeight = $('.navi-left').height();
            if (navHeight < 10) {
                navHeight = $('.navi-left > li').height() * $('.navi-left .navi-root > li').length;
                $('.navi-left').animate({ 'height': navHeight + 'px' })
            } else {
                $('.navi-left').animate({ 'height': '2px' })
                $('.navi-left').slideUp();
            }
            $('.navi-left').slideDown();
        });
    }
});
function loadNaviLeft() {
    $('.navi-left li').hover(function () {
        $(this).find('ul:first').stop(true, true).show();
    }, function () {
        $(this).find('ul:first').stop(true, true).hide();
    });
}
function loadDetailProduct() {
    $('.detail-bottom .tab').hide();
    if ($('.detail-bottom .tab-title h4:first').hasClass('active')) {
        $(this).removeClass('first');
    }
    else {
        $('.detail-bottom .tab-title h4:first').addClass('first');
    }

    var thisIndex = $('.detail-bottom .tab-title h4.active').index();

    $('.detail-bottom .tab:eq(' + thisIndex + ')').show();
    $('.detail-bottom .tab-title h4').click(function () {
        $(this).parent().find('h4').removeClass('active');
        $(this).addClass('active');
        $('.detail-bottom .tab').hide();
        $('.detail-bottom .' + $(this).attr('title')).show();
        if ($('#header .nav .tab-title h4:first').hasClass('active')) {
            $(this).removeClass('first');
        }
        else {
            $('.detail-bottom .tab-title h4:first').addClass('first');
        }
    });
}

function loadOnlineSupport() {
    var supportMode = common.getCookie('supportmode');
    if (supportMode == "collapsed") {
        $('.ft-hotline').addClass('collapsed');
    }
    $('.ft-hotline .fth-title').off('click').click(function (e) {
        var that = $(this);
        if (that.parent().hasClass('collapsed')) {
            document.cookie = "supportmode=expanded; expires=Thu, 18 Dec 2020 12:00:00 UTC";
        } else {
            document.cookie = "supportmode=collapsed; expires=Thu, 18 Dec 2020 12:00:00 UTC";
        }
        that.parent().toggleClass('collapsed');
        e.preventDefault();
    });
}



var $utility = {
    subNavHover: function () {
        if ($('.full-page-subnav').length > 0) {
            $('.hd-index .title-list').addClass('fullpage-title-list');
        }
        var subNavTimeout;
        $('.header .title-list').hover(function () {
            if ($('.full-page-subnav').length > 0) {
                if (subNavTimeout != null) {
                    clearTimeout(subNavTimeout);
                }
                $('.hd-index .title-list').removeClass('fullpage-title-list');
                $('.full-page-subnav .category').stop(true, true).slideDown();
            }
        },


        function () {
            if ($('.full-page-subnav').length > 0) {
                subNavTimeout = setTimeout(function () {
                    $('.full-page-subnav .category').stop(true, true).slideUp(500, function () {
                        $('.hd-index .title-list').addClass('fullpage-title-list');
                    });
                }, 500);
            }
        });
        $('.full-page-subnav .category').hover(function (e) {
            clearTimeout(subNavTimeout);
        }, function () {
            subNavTimeout = setTimeout(function () {
                $('.full-page-subnav .category').stop(true, true).slideUp(500, function () {
                    $('.hd-index .title-list').addClass('fullpage-title-list');
                });
            }, 500);
        });
    },
    fixNoImage: function () {
        $('img[src=""]').attr('src', '/assets/client/images/noimage.jpg');
    },
    removeEmptyCat: function () {
        $('.category .dropdown-menu').not(':has(*)').remove();
    }




};


$(document).ready(function () {




    $('#pradd').click(function (e) {
        e.preventDefault();
        var maxquantity = parseInt($('#prquantity').val());
        var max = 10;
        var min = 1;
        if (maxquantity > max)
        { max = max }
        else (max = maxquantity)



        e.preventDefault();
        var cur = parseInt($('#txtQuantity').val());
        if (cur >= max) {
            cur = max;
        }
        else {
            if (cur < 1) {

                cur = 1;
            }

            else {
                if (cur < max && cur > 0) {
                    cur = cur + 1;
                }
            }
        }
        $('#txtQuantity').val(cur);
    });


    $('#prsub').click(function (e) {
        e.preventDefault();
        var maxquantity = parseInt($('#prquantity').val());
        var max = 10;
        var min = 1;
        if (maxquantity > max)
        { max = max }
        else (max = maxquantity)





        var cur = parseInt($('#txtQuantity').val());
        if (cur <= 1) {
            cur = 1;
        }
        else {
            if (cur > max) {
                cur = max;
            }
            else { cur = cur - 1 }
        }
        $('#txtQuantity').val(cur);
    });



    $('a#cartclick').off('click').on('click', function (e) {
        e.preventDefault();
        var idpr = $('#prid').val();
        var slpr = $('#txtQuantity').val();
        window.location.href = '/Cart/AddToCart?productid=' + idpr + '&quantity=' + slpr;
    });





    //Function + - of cart

    $(document).find('.minus-add').click(function (e) {
        e.preventDefault();
        var maxquantity = parseInt($(this).parent('.quantity').find('.prquantity').val());
        var max = 10;
        var min = 1;
        if (maxquantity > max)
        { max = max }
        else (max = maxquantity)

        var cur = parseInt($(this).parent('.quantity').find('.quantity-text').val());
        if (cur >= max) {
            cur = max;
        }
        else {
            if (cur < 1) {

                cur = 1;
            }

            else {
                if (cur < max && cur > 0) {
                    cur = cur + 1;
                }
            }
        }
        $(this).parent('.quantity').find('.quantity-text').val(cur);
    });


    $(document).find('.plus-sub').click(function (e) {
        e.preventDefault();
        var maxquantity = parseInt($(this).parent('.quantity').find('.prquantity').val());
        var max = 10;
        var min = 1;
        if (maxquantity > max)
        { max = max }
        else (max = maxquantity)


        var cur = parseInt($(this).parent('.quantity').find('.quantity-text').val());
        if (cur <= 1) {
            cur = 1;
        }
        else {
            if (cur > max) {
                cur = max;
            }
            else { cur = cur - 1 }
        }
        $(this).parent('.quantity').find('.quantity-text').val(cur);
    });


});
