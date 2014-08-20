class LessonsDecorator < Draper::CollectionDecorator
	delegate :find
	
  def prev_link
 		h.link_to h.day_path(prev_date(context[:week], context[:day])), class: "btn btn-default", remote: true do
			h.content_tag :span, "", class: "glyphicon glyphicon-chevron-left"
		end
  end

  def next_link
  	h.link_to h.day_path(next_date(context[:week], context[:day])), class: "btn btn-default", remote: true do
  		h.content_tag :span, "", class: "glyphicon glyphicon-chevron-right"
  	end
  end

  def dropdown_links
  	html = ""
  	(1..7).each do |i| 
			html += <<-HTML
				<li class='presentation'>
					#{h.link_to h.to_day(i), h.day_path(week: context[:week], day: i), "role" => "menuitem",  "tabindex" => "-1", remote: true}
				</li>
			HTML
		end
		html.html_safe
  end

  private 
  	def prev_date(week, day)
	  	if day <= 1
	  		{ week: week - 1, day: 7 }
	  	else 
	  		{ week: week, day: day - 1 }
	  	end
	  end

	  def next_date(week, day)
	  	if day >= 7
	  		{ week: week + 1, day: 1 }
	  	else 
	  		{ week: week, day: day + 1 }
	  	end
	  end
end
