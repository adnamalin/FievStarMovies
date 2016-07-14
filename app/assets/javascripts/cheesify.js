$( document ).ready(function() {
    $("a.cheesy").on("click", function(event){
      event.preventDefault();
      $("body").css("background-image", "url('/assets/cheese.png')")
      // ("background-image", "asset-data-url('test.jpg')")
    });

});
