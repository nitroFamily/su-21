var timerOpt = {
  "animation": "smooth",
  "bg_width": 0.5,
  "fg_width": 0.01,
  "circle_bg_color": "#60686F",
  "time":
    {
    	"Days":
	      {
	      	"text": "Дней",
		      "color": "#ffa500",
		      "show": true
	      },
	    "Hours":
	    	{
	      	"text": "Часов",
	      	"color": "#ffa325",
	      	"show": true
	      },
	    "Minutes":
	      {
	      	"text": "Минут",
	      	"color": "#ffa243",
	      	"show": true
	      },
	    "Seconds":
	      {
	      	"text": "Секунд",
	      	"color": "#ffa169",
	      	"show": false
	      }
    }
}

function timer_ready(){
	$("#time").TimeCircles(timerOpt);
};

$(document).ready(timer_ready);
$(document).on('page:load', timer_ready);
