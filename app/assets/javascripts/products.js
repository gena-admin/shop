$( document ).ready(function() {
    $('#producShowModal').on('show.bs.modal', function (event) {
        var error_message = 'Something went wrong';
        var button = $(event.relatedTarget);
        var product_id = button.data('id');
        var modal = $(this);

        $.ajax({
            type: 'get',
            url: '/products/' + product_id,
            dataType: "json",
            error: function(response) {
                console.log('Error');
            },
            success: function(response) {
                modal.find('.name').text(response['name']);
                modal.find('.brand').text(response['brand']);
                modal.find('.model').text(response['model']);
                modal.find('.price').text(response['price']);
                modal.find('.desc').text(response['desc']);
                modal.find('.buy-button').data("id", response['id']);
            }
        });


    });

    $('.buy-button').click(function(){
        $.ajax({
            type: 'put',
            url: '/products/' + $(this).data('id') + '/add_to_cart/',
            dataType: "json",
            error: function(response) {
                show_modal_alert('alert-danger', response.statusText);
            },
            success: function(response) {
                show_modal_alert('alert-success', 'Product has been added to cart');
                $('.cart_items').text(response['total_number']);
            }
        });
    });

    function show_modal_alert(status, message) {
        $('.modal-flash-area').addClass(status);
        $('.modal-flash-area').html('<b>' + message + '</b>');
        $('.modal-flash-area').fadeIn().delay(1000).fadeOut(function(){
            $(this).html('');
            $(this).removeClass(status);
        });
    }

});
