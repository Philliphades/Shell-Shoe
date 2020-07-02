var layoutObj = {
    init: function () {
        layoutObj.loadSupportInfo();
    },
    loadSupportInfo: function () {
        $.ajax({
            type: "GET",
            url: "/Admin/Support/ListAll",
            data: { pageIndex: 1, pageSize: 100 },
            dataType: "json",
            beforeSend: function () {
                common.startLoading();
            },
            success: function (response) {
                if (response.Status) {
                    var template = $('#tmpl-support-online').html();
                    var render = "";
                    if (response.TotalRow > 0) {
                        $.each(response.Data, function (i, item) {
                            var status = item.Status == true && (item.Skype != null || item.Yahoo != null || item.Phone != null);
                            if (status) {
                                var renData = { Name: item.Name };
                                if (item.Skype != null) {
                                    renData.Skype = item.Skype;
                                }
                                if (item.Yahoo != null) {
                                    renData.Facebook = item.Yahoo;
                                }
                                if (item.Phone != null) {
                                    renData.Phone = item.Phone;
                                }
                                render += Mustache.render(template, renData);
                            }
                        });
                        $('.ft-hotline .fth-body').html(render);
                    }
                }
            },
            error: function (er) {
                console.log(er);
            }
        }).always(function () {
            common.stopLoading();
        });
    }
};
layoutObj.init();