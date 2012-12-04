

    function is_int(value){ 
      if((parseFloat(value) == parseInt(value)) && !isNaN(value)){
        return true;
      } else { 
        return false;
      } 
    }

    $(function() {

      // Set up
      $(".fancy-form div > div").hide();
      var firstReveal = true;

      $("#zip").keyup(function() {

        // Cache 
        var el = $(this);

        // Did they type five integers?
        if ((el.val().length == 5) && (is_int(el.val())))  {

          // Call Ziptastic for information
          $.ajax({
            url: "http://zip.elevenbasetwo.com",
            cache: false,
            dataType: "json",
            type: "GET",
            data: "zip=" + el.val(),
            success: function(result, success) {

              $(".zip-error, .instructions").slideUp(200);

              $("#city").val(result.city);

              $("#state").val(result.state);			

              $(".fancy-form div > div").slideDown();

              if (firstReveal) {
                // Ghetto but without this timeout the field doesn't
                // take focus for some reason.
                setTimeout(function() { $("#address-line-1").focus(); }, 
                  400);
              };

              firstReveal = false;		

            },
            error: function(result, success) {

              $(".zip-error").slideDown(300);

            }

          });

        } else if (el.val().length < 5) {

          $(".zip-error").slideUp(200);

        };

      });

    }); // END DOM Ready
