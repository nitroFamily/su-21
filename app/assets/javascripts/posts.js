function posts_ready() {
	$("p").has("img").each(function(i, p){
		$(p).children().filter("img").wrap(function(){ 
			$(this).show();
			return "<a title='"+ this.alt +"' href='"+ this.src +"'></a" 
		}); // end wrap
		$(p).children().filter("br").remove();
		$(p).addClass("gallery");
	}); // end each
	$('.gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title');
			}
		}
	}); // end magnificPopup
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
}; // end ready


$(document).ready(posts_ready);
$(document).on('page:load', posts_ready);