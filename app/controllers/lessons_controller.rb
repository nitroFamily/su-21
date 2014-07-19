class LessonsController < ApplicationController
	include LessonsHelper
	before_action :set_day_info
	
	def day
		@lessons = Lesson.where("day = ? AND start_week <= ? AND end_week >= ? AND (periodicity = ? OR periodicity = 3)", 
											@current_day, 
											@current_week, 
											@current_week,
											@periodicity)
											.order(number: :asc)
	end

	def week
		@lessons = Lesson.where("start_week <= ? AND end_week >= ? AND (periodicity = ? OR periodicity = 3)",
											@current_week,
											@current_week,
											@periodicity)
											.order(number: :asc)
	end

	private
		def set_day_info
			day_info = get_day_info
			@current_week = day_info[0]
			@current_day = day_info[1]
			@periodicity = day_info[2]
		end
end
