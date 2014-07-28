// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require admin/lessons
//= require lessons
//= require TimeCircles
//= require static_pages

(function($) {
  $(document).ready(function() {
    $.slidebars();
    $("#sb-site").addClass("gradient");

   	$("#random-img button").click(function(){
      $(".photo").fadeOut();  
   		var tumblrUrl = "http://api.tumblr.com/v2/blog/";
   		var tumblrData = {
 				limit: 1,
 				api_key: "AyOAAqS8hOLrMwUZrTqaBsj8DU9QNYQojpN3bmp4bRceGoX8QA",
        offset: Math.floor(Math.random() * 1000)
 			}; 
   		if($(this).attr("who") == "Ann") {
   			tumblrUrl += "photogenicfelines.tumblr.com/posts?callback=?";
   		} else {
   			tumblrUrl += "naughty-butt-nice.tumblr.com/posts?callback=?";
        tumblrData.tag = "butt";
   		}
   		function displayPhoto(data) {
   			var photoHTML = "<a href='" + data.response.posts[0].image_permalink + "' target='blank'><img src='" + data.response.posts[0].photos[0].alt_sizes[2].url + "'></a>";
   			$(".photo").html(photoHTML).fadeIn();
   		}
   		$.getJSON(tumblrUrl, tumblrData, displayPhoto);
   	}); // end click

    $(".lesson-preview").fadeIn();
    $(".posts-preview #fa-spin-wrapper").show();
    $.getScript("vk_posts");

    $("#lessons .list-group").show();
    $("#lessons").on('click', '.day-nav a', function(){
      $(".list-group").fadeOut(400, function(){
        $("#fa-spin-wrapper").show();
      });
    });
    
    $("#week_lessons").on('click', '.pagination a', function(){
      $("#fa-spin-wrapper").show();
      $("#week_lessons table").addClass("disabled");
    });

  }); // end ready
}) (jQuery);