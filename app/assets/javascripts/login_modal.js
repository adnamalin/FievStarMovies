$(document).ready(function() {
  $("a[href='/login']").on("click", function(e) {
    e.preventDefault();
    $.get("/login", function(response) {
      toggle(response);
    });
  });

  $("a[href='/users/new']").on("click", function(e) {
    e.preventDefault();
    $.get("/users/new", function(response) {
      toggle(response);
    });
  });
});

function toggle(response) {
  if ($("#modal_login_container").length) {
    $("#modal_login_container").remove();
  } else {
    $("body").prepend(response);
  }
}
