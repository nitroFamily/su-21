$(document).ready(function() {
	var button = $(".bottom-button");
	var body = $("body");
 	$(document).scroll(function(){
 		var top = body.scrollTop();
 		if(top > 500) {
 			button.removeClass("hidden");
 		} else {
 			button.addClass("hidden");
 		}
 	}); // end scroll
 	button.click(function(){
 		button.addClass("hidden");
 		body.animate({scrollTop: 0}, 500);
 	}); // end click
}); // end ready