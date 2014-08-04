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
//= require turbolinks
//= require bootstrap
//= require tumblr_img
//= require slidebars
//= require day
//= require home
//= require week
//= require magnific
//= require posts
//= require timer/timer
//= require timer/timer_options
//= require epic/epiceditor
//= require epic/epiceditor_options


function ready() {
	var slidebar = new $.slidebars();
  $("#sb-site").addClass("gradient");
 	$("#random-img button").click(getRandomImage);
 	$(document).scroll(function(){
 		var top = $("body").scrollTop();
 		$("#nav-wrapper").css({ top: top });
 	});
 	if($("#epiceditor")[0]) {
    new EpicEditor(opts).load();
  }; // end if
}; // end ready

$(document).ready(ready);
$(document).on('page:load', ready);
// $(document).on("page:before-change", $("#sb-site"));
