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
//= require epiceditor

var opts = {
  container: 'epiceditor',
  textarea: 'post_text',
  basePath: 'epiceditor',
  clientSideStorage: false,
  useNativeFullsreen: true,
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
  },
  theme: {
    base: 'http://localhost:3000/assets/epic/epiceditor.css',
    preview: 'http://localhost:3000/assets/bootstrap.css',
    editor: 'http://localhost:3000/assets/epic/epic-light.css'
  },
  button: {
    preview: true,
    fullscreen: true
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  }
};

(function($) {
  $(document).ready(function() {
    $.slidebars();
    if($("#epiceditor")[0]) {
      var editor = new EpicEditor(opts).load();
    }
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
    $(".posts-preview .list-group").fadeIn();
    $(".vk-preview #fa-spin-wrapper").show();
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