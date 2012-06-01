  $(document).ready(function(){
    
    $(".theme-submit-btn").click(function()
    {
      $("#content").css("background-image","none");
      $("#load_image").show();
    });

    $("#cancel_button").click(function()
    {
      $.colorbox.close();
    });

    $(".theme_options").change(function()
      {
      var theme_name=$(this).val();
         $("#content").css("background-image","url('/assets/store/"+theme_name+".png')");
      });
  });