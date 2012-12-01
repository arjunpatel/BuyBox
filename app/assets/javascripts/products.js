$(document).ready(function() {


    $('#pe_price').keyup(function() {
        if ($(this).val() != "") {
            $.ajax({
                url: "/products/buybox_genie?query_params=" + $(this).val(),
                success: function(results) {
                    $('#price_estimate_price').text(results);
                }
            });
        }
    });

});