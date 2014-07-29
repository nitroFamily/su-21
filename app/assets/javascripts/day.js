$(document).ready(function(){
	$("#lessons .list-group").show();
	$("#lessons").on('click', '.day-nav a', function(){
	  $(".list-group").fadeOut(400, function(){
	    $("#fa-spin-wrapper").show();
	  });
	});
});