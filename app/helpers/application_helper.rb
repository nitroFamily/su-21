module ApplicationHelper
	def type_by_num num
		case num
	    when 1 then "Лекция"
	    when 2 then "Практика"
	    else "Лабораторная"
		end
	end
end
