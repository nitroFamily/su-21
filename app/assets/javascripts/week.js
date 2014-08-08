function week_ready(){
	$("#week_lessons").on('click', '.pagination a', function(){
		$("#spinner").show();
    $("#week_lessons table").addClass("disabled");
  });
}; // end ready

$(document).ready(week_ready);
$(document).on('page:load', week_ready);