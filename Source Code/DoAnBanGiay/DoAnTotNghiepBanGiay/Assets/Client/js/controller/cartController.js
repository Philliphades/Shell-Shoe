var cart = {

    init: function () {
        cart.regEvents();
    },
    regEvents: function () {

        //UPDATE
        $('#btnUpdateCart').off('click').on('click', function (e) {
            e.preventDefault();

            var listProduct = $('.quantity-text');
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push(
                    {
                        Quantity: $(this).val(),
                        Product: {
                            ID: $(item).data('id')
                        }

                    });
            });


            $.ajax({
                url: '/GioHang/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {

                    if (res.status == true) {
                        window.location.href = "/GioHang";
                    }
                }
            })
        });

        //DELETE ALL
        $('#btnDeleteAll').off('click').on('click', function () {

            $.ajax({
                url: '/GioHang/DeleteAll',
                dataType: 'json',
                type: 'POST',
                success: function (res) {

                    if (res.status == true) {
                        window.location.href = "/GioHang";
                    }
                }
            })
        });



        //DELETE ONCE
        $('.btnDelete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/GioHang/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {

                    if (res.status == true) {
                        window.location.href = "/GioHang";
                    }
                }
            })
        });
    }
}

cart.init();