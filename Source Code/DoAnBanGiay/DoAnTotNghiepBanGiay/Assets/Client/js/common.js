var common = {
    init: function () {
        common.registerControl();
    },
    registerControl: function () {

    },
    login: function () {
        var userName = $('#txtLoginEmail').val().trim();
        var password = $('#txtLoginPassword').val().trim();
        $.ajax({
            type: "POST",
            url: "/Home/Login",
            data: { userName: userName, password: password },
            dataType: "json",
            success: function (response) {
                if (response.Message == "NOUSER") {
                    $('#lblErrorUser').show();
                    $('#lblErrorUser').text('Tài khoản này không tồn tại.');
                }
                else if (response.Message == "LOCKED") {
                    $('#lblErrorUser').show();
                    $('#lblErrorUser').text('Tài khoản này đang bị khóa bởi quản trị viên.');
                }
                else if (response.Message == "SUCCESS") {
                    window.location = "/";
                } else {
                    $('#lblErrorPassword').show();
                    $('#lblErrorPassword').text('Mật khẩu không đúng.');
                }
            }
        });
    },
    //--------------Message alert--------------------
    alert: function (options) {
        var titleHeader = "";
        if (typeof options.titleHeader != undefined) {
            titleHeader = options.titleHeader;
        }
        var defaultOptions = {
            layout: 'center',
            theme: 'defaultTheme',
            type: 'alert',
            text: '',
            dismissQueue: true,
            template: '<div class="noty_message"><div class="noty-header">' + titleHeader + '</div><div class="noty_text"></div><div class="noty_close"></div></div>',
            animation: {
                open: { height: 'toggle' },
                close: { height: 'toggle' },
                easing: 'swing',
                speed: 500
            },
            timeout: 1000, //1s
            force: false,
            modal: true,
            maxVisible: 1, // max item display
            closeWith: ['button'], /// ['click', 'button', 'hover']
            callback: {
                onShow: function () {
                },
                afterShow: function () {
                    var that = this;
                    $.each(that.options.buttons, function (i, v) {
                        if (v.focus != undefined && v.focus == true) {
                            $(that.$buttons).find("button")[i].focus();
                            return false;
                        }
                    });
                },
                onClose: function () {
                },
                afterClose: function () {
                },
                onCloseClick: function () {
                }
            },
            buttons: false
        };
        /* merge options into defaultOptions, recursively */
        $.extend(true, defaultOptions, options);


        if (defaultOptions.type == 'success') {
            defaultOptions.callback.onClose.call();
            this.log(defaultOptions.text);
        } else {
            if (defaultOptions.type == 'showsuccess') {
                defaultOptions.type = 'success';
            }

            return noty(defaultOptions);
        }
        //return noty(defaultOptions);
    },
    msgAlert: function (options, callback) {
        var settings = $.extend({}, { type: 'alert' }, options);
        this.alert(settings);
    },
    msgSuccess: function (options) {
        var settings = $.extend({}, { type: 'success' }, options);
        this.alert(settings);
    },
    msgError: function (options) {
        var settings = {
            type: 'error',
            buttons: [{
                //addClass: 'btn btn-primary',
                addClass: 'btn btn-grey btn-crm btn-ok',
                text: 'OK',
                onClick: function ($noty) {
                    // this = button element
                    // $noty = $noty element
                    $noty.close();
                },
                focus: false
            }],
            modal: true,
            titleHeader: 'Thông báo lỗi:'
        };
        $.extend(true, settings, options);
        this.alert(settings);
    },
    msgWarning: function (options) {
        var settings = {
            type: 'warning',
            buttons: [{
                //addClass: 'btn btn-primary',
                addClass: 'btn btn-grey btn-crm btn-ok',
                text: 'OK',
                onClick: function ($noty) {
                    // this = button element
                    // $noty = $noty element
                    $noty.close();
                },
                focus: false
            }],
            modal: true,
            titleHeader: 'Thông báo'
        };
        $.extend(true, settings, options);
        this.alert(settings);
    },
    msgInfor: function (options) {
        var settings = $.extend({}, { type: 'information' }, options);
        this.alert(settings);
    },
    msgShowSuccess: function (options) {
        var settings = {
            type: 'showsuccess',
            buttons: [{
                addClass: 'btn btn-grey btn-crm btn-ok',
                text: 'OK',
                onClick: function ($noty) {
                    $noty.close();
                },
                focus: false
            }],
            modal: true,
            titleHeader: 'Thành công'
        };
        $.extend(true, settings, options);
        this.alert(settings);
    },
    msgConfirm: function (options, callback) {
        var settings = {
            type: 'confirm',
            buttons: [{
                //addClass: 'btn btn-primary',
                addClass: 'btn btn-success btn-crm btn-ok',
                text: 'Đồng ý',
                onClick: function ($noty) {
                    // this = button element
                    // $noty = $noty element
                    if (callback != undefined)
                        callback();
                    $noty.close();
                },
                focus: false

            }, {
                //addClass: 'btn btn-danger',
                addClass: 'btn btn-grey btn-crm btn-cancel',
                text: 'Hủy bỏ',
                onClick: function ($noty) {
                    $noty.close();
                },
                focus: true
            }],
            modal: true,
            titleHeader: 'Xác nhận'
        };
        $.extend(true, settings, options);
        this.alert(settings);
    },
    msgWarningWithAbort: function (options) {
        var settings = {
            type: 'confirm',
            buttons: [{
                addClass: 'btn btn-grey btn-crm btn-cancel',
                text: 'Abort',
                onClick: function ($noty) {
                    $noty.close();
                }
            }],
            modal: true
        };
        $.extend(true, settings, options);
        this.alert(settings);
    },
    readAlert: function (key) {
        var message = '';
        $.ajax({
            type: "GET",
            url: "/Alert/GetKey",
            data: { key: key },
            dataType: "json",
            async: false,
            success: function (response) {
                if (response.status == true) {
                    message = response.Message;
                }
            }
        });
        return message;
    },
    //--------- set cookie ----------------
    setCookie: function (data) {
        $.cookie('AlertData', data, { expires: 7 });
    },
    //--------------End Message alert--------------------
    //--------------Format Json--------------------
    dateFormatJson: function (datetime) {
        var newdate = new Date(parseInt(datetime.substr(6)));
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        var hh = newdate.getHours();
        var mm = newdate.getMinutes();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        if (hh < 10)
            hh = "0" + hh;
        if (mm < 10)
            mm = "0" + mm;
        return day + "/" + month + "/" + year + " " + hh + ":" + mm;
    },
    convertDatetimeDMY: function (datetime) {
        var newdate = new Date(parseInt(datetime));
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        return day + "/" + month + "/" + year;
    },
    formatDateDMY: function (newdate) {
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        return day + "/" + month + "/" + year;
    },
    dateNow: function () {
        var d = new Date();
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var day = d.getDate();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        return day + "/" + month + "/" + year;
    },
    currentDateMDY: function () {
        var d = new Date();
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var day = d.getDate();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        return month + "/" + day + "/" + year;
    },
    pad: function (num) {
        num = "0" + num;
        return num.slice(-2);
    },
    timeNow: function () {
        var d = new Date();
        var hh = d.getHours();
        var mm = d.getMinutes();
        if (hh < 10)
            hh = "0" + hh;
        if (mm < 10)
            mm = "0" + mm;
        return hh + ":" + mm;
    },
    smalldateFormatJson: function (datetime) {
        if (datetime == '' || datetime == undefined) {
            return '';
        } else {
            var newdate = new Date(parseInt(datetime.substr(6)));
            var month = newdate.getMonth() + 1;
            var day = newdate.getDate();
            var year = newdate.getFullYear();
            if (month < 10)
                month = "0" + month;
            if (day < 10)
                day = "0" + day;
            return day + "/" + month + "/" + year;
        }
    },
    smalldateFormatJson2: function (datetime) {
        var newdate = new Date(parseInt(datetime.substr(6)));
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        return month + "/" + day + "/" + year;
    },
    //---- ajaxPost---------------
    ajaxPost: function (options) {
        var defaultOptions = {
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            //async: false,
            cache: false,
            success: function (result) {
            }
        };
        $.extend(true, defaultOptions, options);
        $.ajax(defaultOptions);
    },
    //------------- loading -----------
    startLoading: function () {
        if ($('.dv-loading').length > 0)
            $('.dv-loading').removeClass('hide');
    },
    stopLoading: function () {
        if ($('.dv-loading').length > 0)
            $('.dv-loading')
                    .addClass('hide');
    },
    miniLoading: function () {
        var loading = '<img src="/Assets/img/mini-loading.gif">';
        return loading;
    },
    mediumLoading: function () {
        var loading = '<img src="/Assets/img/loading.gif">';
        return loading;
    },
    //--------------------------
    InitiateWidgets: function () {
        $('.widget-buttons *[data-toggle="maximize"]').on("click", function (event) {
            event.preventDefault();
            var widget = $(this).parents(".widget").eq(0);
            var button = $(this).find("i").eq(0);
            var compress = "fa-compress";
            var expand = "fa-expand";
            if (widget.hasClass("maximized")) {
                if (button) {
                    button.addClass(expand).removeClass(compress);
                }
                widget.removeClass("maximized");
                widget.find(".widget-body").css("height", "auto");
            } else {
                if (button) {
                    button.addClass(compress).removeClass(expand);
                }
                widget.addClass("maximized");
                maximize(widget);
            }
        });

        $('.widget-buttons *[data-toggle="collapse"]').on("click", function (event) {
            event.preventDefault();
            var widget = $(this).parents(".widget").eq(0);
            var body = widget.find(".widget-body");
            var button = $(this).find("i");
            var down = "fa-plus";
            var up = "fa-minus";
            var slidedowninterval = 300;
            var slideupinterval = 200;
            if (widget.hasClass("collapsed")) {
                if (button) {
                    button.addClass(up).removeClass(down);
                }
                widget.removeClass("collapsed");
                body.slideUp(0, function () {
                    body.slideDown(slidedowninterval);
                });
            } else {
                if (button) {
                    button.addClass(down)
                        .removeClass(up);
                }
                body.slideUp(slideupinterval, function () {
                    widget.addClass("collapsed");
                });
            }
        });

        $('.widget-buttons *[data-toggle="dispose"]').on("click", function (event) {
            event.preventDefault();
            var toolbarLink = $(this);
            var widget = toolbarLink.parents(".widget").eq(0);
            var disposeinterval = 300;
            widget.hide(disposeinterval, function () {
                widget.remove();
            });
        });
    },
    //------------Check file Upload ------------
    checkFileUpload: {
        checkimg: function (file) {
            var flag = false;
            if (file != undefined) {
                var extension = file.substr((file.lastIndexOf('.') + 1));
                // alert(extension);
                switch (extension.toLowerCase()) {
                    case 'jpg':
                    case 'jpeg':
                    case 'png':
                    case 'gif':
                        flag = true;
                        break;
                    default:
                        flag = false;
                }
            }
            return flag;
        },
        checkFile: function (file) {
            var flag = false;
            if (file != undefined) {
                var extension = file.substr((file.lastIndexOf('.') + 1));
                switch (extension.toLowerCase()) {
                    case 'xls':
                    case 'xlsx':
                        //case 'csv':
                        flag = true;
                        break;
                    default:
                        flag = false;
                }
            }
            return flag;
        },

    },
    //----valid----
    valid: {
        isEmailAddress: function (str) {
            var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return pattern.test(str);  // returns a boolean
        },
        isNotEmpty: function (str) {
            var pattern = /\S+/;
            return pattern.test(str);  // returns a boolean
        },
        isNumber: function (str) {
            var pattern = /^\d+$/;
            return pattern.test(str);  // returns a boolean
        },
        validDecima: function (str) {
            var pattern = /^[-+]?[0-9]+(\.[0-9]+)?$/;
            return pattern.test(str);
        },
        validCurrency: function (str) {
            var pattern = /^\$?[1-9][0-9]{0,2}(,[0-9]{3})*(\.[0-9]{2})?$/;
            return pattern.test(str);
        },
    },
    paginate: function (page, total_items, limit) {
        // How many adjacent pages should be shown on each side?
        var adjacents = 1;
        /* Setup page vars for display. */
        if (page == 0) { page = 1 };                    //if no page var is given, default to 1.
        lastpage = Math.ceil(total_items / limit);		//lastpage is = total pages / items per page, rounded up.
        lpm1 = lastpage - 1;						//last page minus 1

        var pagination = "";
        if (lastpage > 1) {
            //not enough pages to bother breaking it up
            if (lastpage < 7 + (adjacents * 2)) {
                for (counter = 1; counter <= lastpage; counter++) {
                    if (counter == page) {
                        pagination += "<li class=\"active pg pg_" + counter + "\"><a href='javascript:void(0)'>" + counter + "</a></li>";
                    } else {
                        pagination += "<li class='pg pg_" + counter + "' data-page=" + counter + "><a href=\"javascript:void(0)\">" + counter + "</a></li>";
                    }
                }
                //enough pages to hide some
            } else if (lastpage > 2 + (adjacents * 2)) {

                //close to beginning; only hide later pages
                if (page < 1 + (adjacents * 2)) {
                    for (counter = 1; counter < 4 + (adjacents * 2) ; counter++) {
                        if (counter == page) {
                            pagination += "<li class=\"active pg pg_" + counter + "\"><a href='javascript:void(0)'>" + counter + "</a></li>";
                        } else {
                            pagination += "<li class='pg pg_" + counter + "' data-page=" + counter + "><a href=\"javascript:void(0)\">" + counter + "</a></li>";
                        }
                    }
                    pagination += "<li class='pg'><a>...</a></li>";
                    pagination += "<li class='pg pg_" + lpm1 + "' data-page=" + lpm1 + "><a href=\"javascript:void(0)\">" + lpm1 + "</a>";
                    pagination += "<li class='pg pg_" + lastpage + "' data-page=" + lastpage + "><a href=\"javascript:void(0)\">" + lastpage + "</a>";
                } else if (lastpage - (adjacents * 2) > page && page > (adjacents * 2)) {
                    //in middle; hide some front and some back
                    pagination += "<li class='pg pg_1' data-page='1'><a href=\"javascript:void(0)\">1</a></li>";
                    pagination += "<li class='pg pg_2' data-page='2'><a href=\"javascript:void(0)\">2</a></li>";
                    pagination += "<li class='pg'><a>...</a></li>";
                    for (counter = page - adjacents; counter <= parseInt(page) + parseInt(adjacents) ; counter++) {
                        if (counter == page) {
                            pagination += "<li class=\"active pg pg_" + counter + "\"><a href='javascript:void(0)'>" + counter + "</a></li>";
                            //$('.pg_' + counter).addClass('active');
                        }
                        else
                            pagination += "<li  class='pg pg_" + counter + "' data-page=" + counter + "><a href=\"javascript:void(0)\">" + counter + "</a></li>";
                    }
                    pagination += "<li class='pg'><a>...</a></li>";
                    pagination += "<li  class='pg pg_" + lpm1 + "' data-page=" + lpm1 + "><a href=\"javascript:void(0)\">" + lpm1 + "</a></li>";
                    pagination += "<li  class='pg pg_" + lastpage + "' data-page=" + lastpage + "><a href=\"javascript:void(0)\">" + lastpage + "</a></li>";
                } else {
                    //close to end; only hide early pages
                    pagination += "<li class='pg pg_1' data-page='1'><a href=\"javascript:void(0);\">1</a></li>";
                    pagination += "<li class='pg pg_2' data-page='2'><a href=\"javascript:void(0);\">2</a></li>";
                    pagination += "<li class='pg'><a>...</a></li>";
                    for (counter = lastpage - (2 + (adjacents * 2)) ; counter <= lastpage; counter++) {

                        if (counter == page) {
                            pagination += "<li class=\"active pg pg_" + counter + "\"><a href='javascript:void(0)'>" + counter + "</a></li>";
                            //$('.pg_' + counter).addClass('active');
                        } else {
                            pagination += "<li class='pg pg_" + counter + "' data-page=" + counter + "><a href=\"javascript:void(0)\">" + counter + "</a></li>";
                        }
                    }
                }
            }
        }
        return pagination;
    },
    formatNumber: function ReplaceNumberWithCommas(yourNumber) {
        //Seperates the components of the number
        var components = yourNumber.toString().split(".");
        //Comma-fies the first part
        components[0] = components[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        //Combines the two sections
        return components.join(".");
    },
    activeSidebarMenu: function () {
        //var dataActive = window.location.pathname.replace(/[0-9a-zA-Z\-\_]*\/+/g, "");
        var pathName = window.location.pathname;
        if (pathName !== undefined && pathName !== null && pathName.length > 1) {
            var dataActive = pathName.split('/');
            $("#sidebar").find("a[href]").each(function () {
                var $this = $(this);
                var $menuData = $this.attr("href").split("/");
                $.each($menuData, function (index, value) {
                    if (value === dataActive[2]) {
                        //$this.addClass("active").parents("ul").collapse("toggle").prev().addClass("active").parent().addClass("active");
                        $this.parent().addClass('active').parents('li').addClass('open');
                        return;
                    }
                });
            });
        }

    },
    dateFormatJson: function (datetime) {
        var newdate = new Date(parseInt(datetime.substr(6)));
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        var hh = newdate.getHours();
        var mm = newdate.getMinutes();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        if (hh < 10)
            hh = "0" + hh;
        if (mm < 10)
            mm = "0" + mm;
        return day + "/" + month + "/" + year + " " + hh + ":" + mm;
    },
    removeSpace: function (origin) {
        if (origin !== undefined && origin !== null && $.type(origin) === 'string') {
            origin = origin.replace(/\s{2,}/g, ' ');
            return $.trim(origin);
        } else {
            return origin;
        }
    },
    imgError: function (image, src) {
        image.onerror = "";
        image.src = src === undefined ? "/assets/client/images/noavatar.png" : src;
        return true;
    },
    randomText: function (textLength) {
        if ($.type(textLength) === 'number') {
            return Math.random().toString(36).substr(2, textLength);
        } else {
            return Math.random().toString(36).substr(2, 7);
        }

    },
    unbindPagination: function (obj) {
        $(obj).empty();
        $(obj).removeData("twbs-pagination");
        $(obj).unbind("page");
    },
    friendlyTime: function (time) {

        switch (typeof time) {
            case 'number': break;
            case 'string': time = +new Date(time); break;
            case 'object': if (time.constructor === Date) time = time.getTime(); break;
            default: time = +new Date();
        }
        var time_formats = [
            [60, 'seconds', 1], // 60
            [120, '1 minute ago', '1 minute from now'], // 60*2
            [3600, 'minutes', 60], // 60*60, 60
            [7200, '1 hour ago', '1 hour from now'], // 60*60*2
            [86400, 'hours', 3600], // 60*60*24, 60*60
            [172800, 'Yesterday', 'Tomorrow'], // 60*60*24*2
            [604800, 'days', 86400], // 60*60*24*7, 60*60*24
            [1209600, 'Last week', 'Next week'], // 60*60*24*7*4*2
            [2419200, 'weeks', 604800], // 60*60*24*7*4, 60*60*24*7
            [4838400, 'Last month', 'Next month'], // 60*60*24*7*4*2
            [29030400, 'months', 2419200], // 60*60*24*7*4*12, 60*60*24*7*4
            [58060800, 'Last year', 'Next year'], // 60*60*24*7*4*12*2
            [2903040000, 'years', 29030400], // 60*60*24*7*4*12*100, 60*60*24*7*4*12
            [5806080000, 'Last century', 'Next century'], // 60*60*24*7*4*12*100*2
            [58060800000, 'centuries', 2903040000] // 60*60*24*7*4*12*100*20, 60*60*24*7*4*12*100
        ];
        var seconds = (+new Date() - time) / 1000,
            token = 'ago', list_choice = 1;

        if (seconds == 0) {
            return 'Just now'
        }
        if (seconds < 0) {
            seconds = Math.abs(seconds);
            token = 'from now';
            list_choice = 2;
        }
        var i = 0, format;
        while (format = time_formats[i++])
            if (seconds < format[0]) {
                if (typeof format[2] == 'string')
                    return format[list_choice];
                else
                    return Math.floor(seconds / format[2]) + ' ' + format[1] + ' ' + token;
            }
        return time;
    },
    updateQuery: function (key, value, uri) {

        var ret = true;

        if (typeof uri == 'undefined') {
            uri = window.location.href;
            ret = false;
        }

        var params = $.deparam(jQuery.param.querystring(uri));
        if (!value) {
            delete params[key];
        } else {
            params[key] = value;
        }
        delete params['page'];

        if (ret) {
            return $.param.querystring(uri, params, 2);
        }

        window.location.href = jQuery.param.querystring(uri, params, 2);
        return false;
    },
    getCookie: function (cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1);
            if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
        }
        return "";
    }
};
common.init();