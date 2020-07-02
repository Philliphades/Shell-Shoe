(function ($) {
    if (!(navigator.userAgent.match(/Android/i)
		 || navigator.userAgent.match(/webOS/i)
		 || navigator.userAgent.match(/iPhone/i)
		 || navigator.userAgent.match(/iPad/i)
		 || navigator.userAgent.match(/iPod/i)
		 || navigator.userAgent.match(/BlackBerry/i)
		 || navigator.userAgent.match(/Windows Phone/i)
		 ) && $(window).width() > 768) {

        $(function () {
            var jcarousel = $('.jcarousel');

            jcarousel
                .on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this),
                        width = carousel.innerWidth();

                    if (width >= 600) {
                        width = width / 4 + 1;
                    } else if (width >= 480) {
                        width = width / 2;
                    } else if (width < 480) {
                        width = width / 1;
                    }
                    carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                })
                .jcarousel({
                    wrap: 'circular'
                });

            var width = jcarousel.innerWidth();
            if (width >= 600) {
                $('.jcarousel-control-prev')

                    .jcarouselControl({
                        target: '-=4'
                    });

                $('.jcarousel-control-next')
                    .jcarouselControl({
                        target: '+=4'
                    });
            } else if (width >= 480) {
                $('.jcarousel-control-prev')

                    .jcarouselControl({
                        target: '-=2'
                    });

                $('.jcarousel-control-next')
                    .jcarouselControl({
                        target: '+=2'
                    });
            } else if (width < 480) {
                $('.jcarousel-control-prev')

                    .jcarouselControl({
                        target: '-=1'
                    });

                $('.jcarousel-control-next')
                    .jcarouselControl({
                        target: '+=1'
                    });
            }


            $('.jcarousel-pagination')
                .on('jcarouselpagination:active', 'a', function () {
                    $(this).addClass('active');
                })
                .on('jcarouselpagination:inactive', 'a', function () {
                    $(this).removeClass('active');
                })
                .on('click', function (e) {
                    e.preventDefault();
                })
                .jcarouselPagination({
                    perPage: 1,
                    item: function (page) {
                        return '<a href="#' + page + '">' + page + '</a>';
                    }
                });
        });
    }
})(jQuery);
(function ($) {
    if (!(navigator.userAgent.match(/Android/i)
		 || navigator.userAgent.match(/webOS/i)
		 || navigator.userAgent.match(/iPhone/i)
		 || navigator.userAgent.match(/iPad/i)
		 || navigator.userAgent.match(/iPod/i)
		 || navigator.userAgent.match(/BlackBerry/i)
		 || navigator.userAgent.match(/Windows Phone/i)
		 ) && $(window).width() > 768) {
        $(function () {
            var jcarousel = $('.newpro2 .jcarousel');

            jcarousel
                .on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this),
                        width = carousel.innerWidth();

                    if (width >= 600) {
                        width = width / 4 + 1;
                    } else if (width >= 480) {
                        width = width / 2;
                    } else if (width < 480) {
                        width = width / 1;
                    }

                    carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                })
                .jcarousel({
                    wrap: 'circular'
                });

            var width = jcarousel.innerWidth();
            if (width >= 600) {
                $('#newpro2 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=4'
					});

                $('#newpro2 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=4'
					});
            } else if (width >= 480) {
                $('#newpro2 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=2'
					});

                $('#newpro2 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=2'
					});
            } else if (width < 480) {
                $('#newpro2 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=1'
					});

                $('#newpro2 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=1'
					});
            }

            $('.jcarousel-pagination')
                .on('jcarouselpagination:active', 'a', function () {
                    $(this).addClass('active');
                })
                .on('jcarouselpagination:inactive', 'a', function () {
                    $(this).removeClass('active');
                })
                .on('click', function (e) {
                    e.preventDefault();
                })
                .jcarouselPagination({
                    perPage: 1,
                    item: function (page) {
                        return '<a href="#' + page + '">' + page + '</a>';
                    }
                });
        });
    }
})(jQuery);
(function ($) {
    if (!(navigator.userAgent.match(/Android/i)
		 || navigator.userAgent.match(/webOS/i)
		 || navigator.userAgent.match(/iPhone/i)
		 || navigator.userAgent.match(/iPad/i)
		 || navigator.userAgent.match(/iPod/i)
		 || navigator.userAgent.match(/BlackBerry/i)
		 || navigator.userAgent.match(/Windows Phone/i)
		 ) && $(window).width() > 768) {
        $(function () {
            var jcarousel = $('.newpro3 .jcarousel');

            jcarousel
                .on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this),
                        width = carousel.innerWidth();

                    if (width >= 600) {
                        width = width / 4 + 1;
                    } else if (width >= 480) {
                        width = width / 2;
                    } else if (width < 480) {
                        width = width / 1;
                    }

                    carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                })
                .jcarousel({
                    wrap: 'circular'
                });

            var width = jcarousel.innerWidth();
            if (width >= 600) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=4'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=4'
					});
            } else if (width >= 480) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=2'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=2'
					});
            } else if (width < 480) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=1'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=1'
					});
            }

            $('.jcarousel-pagination')
                .on('jcarouselpagination:active', 'a', function () {
                    $(this).addClass('active');
                })
                .on('jcarouselpagination:inactive', 'a', function () {
                    $(this).removeClass('active');
                })
                .on('click', function (e) {
                    e.preventDefault();
                })
                .jcarouselPagination({
                    perPage: 1,
                    item: function (page) {
                        return '<a href="#' + page + '">' + page + '</a>';
                    }
                });
        });
    }
})(jQuery);
(function ($) {
    if (!(navigator.userAgent.match(/Android/i)
		 || navigator.userAgent.match(/webOS/i)
		 || navigator.userAgent.match(/iPhone/i)
		 || navigator.userAgent.match(/iPad/i)
		 || navigator.userAgent.match(/iPod/i)
		 || navigator.userAgent.match(/BlackBerry/i)
		 || navigator.userAgent.match(/Windows Phone/i)
		 ) && $(window).width() > 768) {
        $(function () {
            var jcarousel = $('#detail .jcarousel');

            jcarousel
                .on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this),
                        width = carousel.innerWidth();

                    if (width >= 600) {
                        width = width / 4 + 1;
                    } else if (width >= 480) {
                        width = width / 2;
                    } else if (width < 480) {
                        width = width / 1;
                    }

                    carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                })
                .jcarousel({
                    wrap: 'circular'
                });

            var width = jcarousel.innerWidth();
            if (width >= 600) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=4'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=4'
					});
            } else if (width >= 480) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=2'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=2'
					});
            } else if (width < 480) {
                $('#newpro3 .jcarousel-control-prev')

					.jcarouselControl({
					    target: '-=1'
					});

                $('#newpro3 .jcarousel-control-next')
					.jcarouselControl({
					    target: '+=1'
					});
            }

            $('.jcarousel-pagination')
                .on('jcarouselpagination:active', 'a', function () {
                    $(this).addClass('active');
                })
                .on('jcarouselpagination:inactive', 'a', function () {
                    $(this).removeClass('active');
                })
                .on('click', function (e) {
                    e.preventDefault();
                })
                .jcarouselPagination({
                    perPage: 1,
                    item: function (page) {
                        return '<a href="#' + page + '">' + page + '</a>';
                    }
                });
        });
    }
})(jQuery);