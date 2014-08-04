function day_ready(){
	$("#lessons .list-group").show();
	$("#lessons").on('click', '.day-nav a', function(){
	  $(".list-group").fadeOut(400, function(){
	    $("#fa-spin-wrapper").show();
	  });
	});
}; // end ready

$(document).ready(day_ready);
$(document).on('page:load', day_ready);