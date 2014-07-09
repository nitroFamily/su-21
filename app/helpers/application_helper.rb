module ApplicationHelper
	def type_by_num num
		case num
	    when 1 then "Лекция"
	    when 2 then "Практика"
	    else "Лабораторная"
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
