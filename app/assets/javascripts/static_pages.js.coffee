# scrollHandler = ->
#   top_offset = $(document).scrollTop()
#   height = $(".gradient").height()
#   if top_offset > 100
#     # $(".navbar").fadeIn()
#     console.log(top_offset);
#     console.log(height);
#   else
#     # $(".navbar").fadeOut()

# $(document).ready ->
#   # $(".navbar").hide()
#   $(window).scroll scrollHandler


scrollHandler = ->
  top_offset = $(document).scrollTop()
  height = $(".gradient").height()
  if top_offset >= height
    $("nav").addClass("navbar-fixed-top");
  else
    $("nav").removeClass("navbar-fixed-top");

$(document).ready ->
  $(".navbar").removeClass("navbar-fixed-top");
  $(".navbar").addClass("navbar-static-top");
  $(window).scroll scrollHandler
