var getRandomImage = function(){
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
};
