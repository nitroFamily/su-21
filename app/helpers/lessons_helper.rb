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

  def get_day_info
    week = params[:week].blank? ? what_week? : params[:week].to_i
    day = if params[:day].blank?
      Time.now.wday == 0 ? 7 : Time.now.wday
    else 
      params[:day].to_i
    end
    periodicity = week % 2 == 0 ? 2 : 1
    [week, day, periodicity]
  end
end
