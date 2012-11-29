$(document).ready(function() {
    var products = $('#products');
    products.find('li').each(function() {
        $('.product_categories').find("#bb_" + $(this).find('.category').text()).addClass('keep');
    });
    $('.product_categories .category').each(function() {
        if (!$(this).hasClass('keep')) {
            $(this).remove();
        }
    });

    //Capture Click Event
    $(".product_sort input[type=submit]").click(function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });

    //Capture Click Event
    $(".product_categories .category").click(function() {
        $(this).toggleClass('cat_active');
    });
});

// Custom sorting plugin
(function($) {
    $.fn.sorted = function(customOptions) {
        var options = {
            reversed: false,
            by: function(a) {
                return a.text();
            }
        };
        $.extend(options, customOptions);
        $data = $(this);
        arr = $data.get();
        arr.sort(function(a, b) {
            var valA = options.by($(a));
            var valB = options.by($(b));
            if (options.reversed) {
                return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;
            } else {
                return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;
            }
        });
        return $(arr);
    };
})(jQuery);

// DOMContentLoaded
$(function() {

    // bind radiobuttons in the form
    var $filterType = $('.product_categories .category');
    var $filterSort = $(".bb_filter input[name='sort']");

    // get the first collection
    var $applications = $('#products');

    // clone applications to get a second collection
    var $data = $applications.clone();

    // attempt to call Quicksand on every form change
    $filterType.add($filterSort).click(function(e) {
        e.preventDefault();
        var $filteredData;
        //var $filteredData = $data.find('li');


        $('.product_categories .category').each(function(){
            if ($(this).hasClass('cat_active')){
                $filteredData = $.makeArray($filteredData, $data.find("li[data-type=" + $(this).text() + "]"));
            }
        });


        // if sorted by price
        if ($('.bb_filter input[value="Price"]').hasClass('active')) {
            var $sortedData = $filteredData.sorted({
                by: function(v) {
                    return parseFloat($(v).find('div[data-type=price]').text());
                }
            });
        } else {
            // if sorted by name
            var $sortedData = $filteredData.sorted({
                by: function(v) {
                    return $(v).find('div[data-type=name]').text().toLowerCase();
                }
            });
        }

        // finally, call quicksand
        $applications.quicksand($sortedData, {
            duration: 800,
            easing: 'easeInOutQuad'
        });
    });

});