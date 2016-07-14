jQuery ->
  $(".button_submit").live "click", (e) ->
    e.preventDefault()
    $("#new_rating").trigger "submit"
    $("#new_review").trigger "submit"
