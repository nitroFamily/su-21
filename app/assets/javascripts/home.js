$(document).ready(function() {
	$(".lesson-preview").fadeIn();
  $(".posts-preview .list-group").fadeIn();
  $(".vk-preview #list-group-wrapper").height(250);
  $(".vk-preview #fa-spin-wrapper").show();
  if($(".vk-preview")[0]) {
  	$.getScript("vk_posts");
  }
});