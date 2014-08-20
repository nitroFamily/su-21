module LessonsHelper
	def what_week?
    point_week = Settings.date.to_datetime.strftime("%W").to_i
    current_week = Time.now.strftime("%W").to_i
    current_week - point_week + 1
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
