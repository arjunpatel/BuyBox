$(document).ready(function() {


    $('#pe_price').keyup(function() {
        if ($(this).val() != "") {
            $.ajax({
                url: "/products/buybox_genie?query_params=" + $(this).val(),
                dataType: 'json',
                success: function(results) {
                    $('#price_estimate_price').text(results.price);
                    $('#price_estimate_brand').text(results.brand);
                },error: function(e){
                    $('#price_estimate_price').text("No Estimate");
                }
            });
        }
    });

    $('#populate_genie').click(function(){
        $('#product_price').val($('#price_estimate_price').text().substring(2,$('#price_estimate_price').text().size));
        $('#product_brand').val($('#price_estimate_brand').text());
    });


    $('#product_add').submit(function(e) {
        if (isNaN($('#product_price').val() / 1) == true ||
            isNaN($('#product_zip').val() / 1) == true ||
            isNaN($('#product_quantity').val() / 1) == true
            ) {
            $('#error_modal').modal('show');
            e.preventDefault();
        }

        if ($('#product_product_name').val() == "" ||
            $('#product_description').val() == "" ||
            $('#product_price').val() == "" ||
            $('#product_zip').val() == "" ||
            $('#product_quantity').val() == "") {
            $('#error_modal').modal('show');
            e.preventDefault();
        }


    });

});