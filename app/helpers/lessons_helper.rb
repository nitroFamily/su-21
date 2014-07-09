module LessonsHelper
	def what_week?
    point_week = 14
    current_week = Time.now.strftime("%W").to_i
    current_week - point_week
  end
end
