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

function stringToTime(string) {
  var time = string.split("-");
  for (var i = 0; i < time.length; i++) {
    time[i] = time[i].trim().split(":");
    var date = new Date;
    date.setHours(parseInt(time[i][0]));
    date.setMinutes(parseInt(time[i][1]));
    time[i] = date;
  };
  return time;
}

function getLessonByTime(lessons, time) {
  for (var i = 0; i < lessons.length; i++) {
    var lessonTime = stringToTime(lessons[i].number);
    if(time.getHours() >= lessonTime[0].getHours() && time.getHours() <= lessonTime[1].getHours()) {
      return lessons[i];
    } else {
      continue;
    }
  }
}

function prepare_today() {
  var time = new Date;
  console.log(time.getHours());
  var dayUrl = "day.json"
  function displayLesson(data) {
    console.log(data);
    if(time < stringToTime(data[0].number)[0]) {
      console.log("Пары еще не начались");
    } else {
      console.log("Уже идут");
      getLessonByTime(data, time);
    }
  }
  $.getJSON(dayUrl, displayLesson);
}

function prepare_tomorrow() {
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
    $(".lesson-preview h5").text("Первая пара завтра");
    $(".lesson-preview h3").text(data[0].name);
    $(".lesson-preview .time").after(data[0].number);
    $(".lesson-preview .classroom").after(data[0].classroom);
    $(".lesson-preview .type").after(data[0].form);
    $(".lesson-preview").append("<h5><a href='/day?week=" + week + "&day=" + day +"'>Обзор дня</a></h5>");
  }
  $.getJSON(dayUrl, dayData, displayLesson);
}


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

    if((new Date).getHours() > 18) {
      prepare_tomorrow();
    } else {
      prepare_today();
    }

  }); // end ready
}) (jQuery);