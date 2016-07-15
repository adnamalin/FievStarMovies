$( document ).ready(function() {

  var audioElement = document.createElement('audio');
    audioElement.setAttribute('src', 'assets/cheesy-sounds.mp3');

    $("a.cheesy").on("click", function(event){
      event.preventDefault();
      $("body").css("background-image", "url('/assets/cheese.png')")
      // ("background-image", "asset-data-url('test.jpg')")
      $(".poster").attr("src", '/assets/cheesy-poster.jpg')
      audioElement.play();
    });

});
