$( document ).ready(function() {
    $(".movie-review-form-page").on("submit", "#new_rating",function(event){
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
