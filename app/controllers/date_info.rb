class DateInfo 
	attr_accessor :week, :day, :periodicity, :date

	def initialize(week, day)
		day_info = DateInfo.get_day_info(week, day)
		@week = day_info[0]
		@day = day_info[1]
		@periodicity = day_info[2]
		@date = day_info[3]
	end

	def self.what_week?
		point_week = Settings.date.to_datetime.strftime("%W").to_i
    current_week = Time.now.strftime("%W").to_i
    current_week - point_week + 1
	end

	def self.get_day_info(week = nil, day = nil)
		week = week.blank? ? what_week? : week.to_i
    day = if day.blank?
      Time.now.wday == 0 ? 7 : Time.now.wday
    else 
      day.to_i
    end
    periodicity = week % 2 == 0 ? 2 : 1
    date = (Settings.date.to_datetime + ((week - 1) * 7 + (day - 1)).days).strftime("%e %b")
    [week, day, periodicity, date]
	end
end