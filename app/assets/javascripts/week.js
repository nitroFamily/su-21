$(document).ready(function(){
	$("#week_lessons").on('click', '.pagination a', function(){
    $("#fa-spin-wrapper").show();
    $("#week_lessons table").addClass("disabled");
  });
});