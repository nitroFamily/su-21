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


function prepareToday() {
  var dayUrl = "day.json"
  function displayLesson(data) {
    console.log(data);
    $(".lesson-preview").prepend("<h5><a href='/day?week'>Сегодня " + data.length + " пары</a></h5><hr>");
    $(".lesson-preview").append("<h5>С " + data[0].number.split("-")[0] + "</h5>");
    lessonHTML = "<table>";
    for (var i = 0; i < data.length; i++) {
      lessonHTML += "<tr>";
      lessonHTML += "<td>" + data[i].name + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-time time'></span>" + data[i].number.split("-")[0] + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-map-marker classroom'></span>" + data[i].classroom + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-pencil type'></span>" + data[i].form + "</td>";
      lessonHTML += "</tr>";
    }
    lessonHTML += "</table>";
    $(".lesson-preview").append(lessonHTML);
    $(".lesson-preview").append("<h5>До " + data[data.length - 1].number.split("-")[1] + "</h5>");
    $(".lesson-preview").fadeIn();
  } // end displayLessons
  $.getJSON(dayUrl, displayLesson);
} // end prepareToday

function prepareTomorrow() {
  var week = parseInt($(".lesson-preview").attr("week"));
  var day = parseInt($(".lesson-preview").attr("day"));
  if(day > 6) {
    day = 1;
    week += 1;
  } else {
    day += 1;
  }
  var dayUrl = "day.json"
  var dayData = { 
    "day": day,
    "week": week
  };
  function displayLesson(data) {
    console.log(data);
    $(".lesson-preview").prepend("<h5><a href='/day?week'>Завтра " + data.length + " пары</a></h5><hr>");
    $(".lesson-preview").append("<h5>С " + data[0].number.split("-")[0] + "</h5>");
    lessonHTML = "<table>";
    for (var i = 0; i < data.length; i++) {
      lessonHTML += "<tr>";
      lessonHTML += "<td>" + data[i].name + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-time time'></span>" + data[i].number.split("-")[0] + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-map-marker classroom'></span>" + data[i].classroom + "</td>";
      lessonHTML += "<td><span class='glyphicon glyphicon-pencil type'></span>" + data[i].form + "</td>";
      lessonHTML += "</tr>";
    }
    lessonHTML += "</table>";
    $(".lesson-preview").append(lessonHTML);
    $(".lesson-preview").append("<h5>До " + data[data.length - 1].number.split("-")[1] + "</h5>");
    $(".lesson-preview").fadeIn();
  } // end displayLessons
  $.getJSON(dayUrl, dayData, displayLesson);
} // end prepareTomorrow;


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
   			var photoHTML = "<img src='" + data.response.posts[0].photos[0].alt_sizes[2].url + "'>";
   			$(".photo").html(photoHTML).fadeIn();
   		}
   		$.getJSON(tumblrUrl, tumblrData, displayPhoto);
   	}); // end click

    if((new Date).getHours() >= 18) {
      prepareTomorrow();
      console.log("Завтра");
    } else {
      prepareToday();
      console.log("Сегодня");
    }

  }); // end ready
}) (jQuery);