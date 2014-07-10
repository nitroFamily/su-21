module ApplicationHelper
	def to_type num
		case num
	    when 1 then "Лекция"
	    when 2 then "Практика"
	    else "Лаб-я"
		end
	end

	def to_day num
		case num
			when 1 then "Понедельник"
	    when 2 then "Вторник"
	    when 3 then "Среда"
	    when 4 then "Четверг"
	    when 5 then "Пятница"
	    when 6 then "Суббота"
	    else "Воскресение"
	   end
	end

	def to_time num
		case num
			when 1 then "9:00 - 10:35"
	    when 2 then "10:45 - 12:20"
	    when 3 then "13:00 - 14:35"
	    when 4 then "14:45 - 16:20"
	    else "16:30 - 18:05"
	  end
	end

	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to params.merge(sort: column, direction: direction, page: nil) do
			if column == sort_column
				title += " "
				if sort_direction == "asc"
					title += "<i class='fa fa-sort-asc'></i>"
				else
					title += "<i class='fa fa-sort-desc'></i>"
				end
				raw title
			else
				raw title + ' <i class="fa fa-sort"></i>'
			end
		end
	end
end
