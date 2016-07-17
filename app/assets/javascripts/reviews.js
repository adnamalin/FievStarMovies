$( document ).ready(function() {
    $(".movie-review-form-page").on("submit", "#new_rating",function(event){
      event.preventDefault();
      var url= $(this).attr('action');
      var rating_data = $(this).serialize();
      $.post(url, rating_data, function(response){
       $('.first-rating-form').fadeOut(300);
       $('.dynamic-form').html(response);
       $('.dynamic-form').fadeIn(300);
      });
    });

    $('a.add-comment-link').on("click", function(e){
      e.preventDefault();
      var $clickedLink = $(this);
      var url = $(this).attr('href');
      $.get(url, function(response){
        $clickedLink.hide();
        $clickedLink.siblings('div.comment-form').html(response);
        $clickedLink.siblings('div.comment-form').slideToggle("slow");
      })
    });

    $(".individual_review").on("submit", "#new_comment",function(e){
      e.preventDefault();
      var $clickedSubmit = $(this);
      var url= $(this).attr('action');
      var comment_data = $(this).serialize();
      $.post(url, comment_data, function(response){
        $clickedSubmit.hide("slow");
        $clickedSubmit.empty();
        $clickedSubmit.parent().siblings('div.comment_container').children('div.comment-list').append(response);
        $clickedSubmit.parent().siblings('.add-comment-link').show();

      });
    });

    $('.view-comment').on("click", function(e){
      e.preventDefault();
      $(this).parent().siblings('div.comment-list').toggle("slow");
    })

});
