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
  $(window).scroll scrollHandler;
  $(".example").TimeCircles(
	  animation: "smooth"
	  bg_width: 0.5
	  fg_width: 0.01
	  circle_bg_color: "#60686F"
	  time:
	    Days:
	      text: "Дней"
	      color: "#ffa500"
	      show: true

	    Hours:
	      text: "Часов"
	      color: "#ffa325"
	      show: true

	    Minutes:
	      text: "Минут"
	      color: "#ffa243"
	      show: true

	    Seconds:
	      text: "Секунд"
	      color: "#ffa169"
	      show: true
	      )

