json.array! @lessons do |lesson|
	json.name lesson.name
	json.form to_type lesson.form
	json.number to_time lesson.number
	json.classroom lesson.classroom
	json.day lesson.day
end