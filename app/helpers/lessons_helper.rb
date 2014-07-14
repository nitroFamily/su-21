module LessonsHelper
	def what_week?
    point_week = Settings.date.to_datetime.strftime("%W").to_i
    current_week = Time.now.strftime("%W").to_i
    current_week - point_week + 1
  end

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
