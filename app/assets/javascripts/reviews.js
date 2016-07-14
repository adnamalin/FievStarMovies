$( document ).ready(function() {
    $("#new_rating").on("submit", function(event){
      event.preventDefault();
      var url= $(this).attr('action');
      var rating_data = $(this).serialize();
      console.log(rating_data);
      $.post(url, rating_data, function(response){
       $('.first-rating-form').fadeOut(300);
       $('.dynamic-form').html(response);
       $('.dynamic-form').fadeIn(300);
      });
    });

});
