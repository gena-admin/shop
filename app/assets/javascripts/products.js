$( document ).ready(function() {
    $('#producShowModal').on('show.bs.modal', function (event) {
        var error_message = 'Something went wrong';
        var button = $(event.relatedTarget) // Button that triggered the modal
        var product_id = button.data('id') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

        console.log(product_id);
        var modal = $(this);

        $.ajax({
            type: 'get',
            url: '/products/' + product_id,
            dataType: "json",
            error: function(response) {
                // error_callback(error_message)
                console.log('Error');
            },
            success: function(response) {


                modal.find('.name').text(response['name']);
                modal.find('.brand').text(response['brand']);
                modal.find('.model').text(response['model']);
                modal.find('.price').text(response['price']);
                modal.find('.desc').text(response['desc']);
                modal.find('.buy-button').data("id", response['id']);


                // if(response && response.status == 200) {
                //     success_callback(response.message);
                // } else {
                //     error_callback(response.error || error_message);
                // }
            }
        });


    });

    $('.buy-button').click(function(){
        $.ajax({
            type: 'put',
            url: '/products/' + $(this).data('id') + '/add_to_cart/',
            dataType: "json",
            error: function(response) {
                console.log(response);
                console.log('Error');
            },
            success: function(response) {
                console.log('total_number: ' + response['total_number']);
                $('.cart_items').text(response['total_number']);
            }
        });
    });
});
