class LessonsController < ApplicationController
	include LessonsHelper

	def day
		@current_week = get_week_and_day[0]
		@current_day = get_week_and_day[1]
		@lessons = Lesson.where("day = ? AND start_week <= ? AND end_week >= ?", @current_day, @current_week, @current_week)
										 .order(number: :asc)
	end

	def week

	end

	private 
		def get_week_and_day
			day = params[:day].to_i
			day = day == 0 || day > 18 * 7 ? Time.now.wday : day
			diff = day.divmod 7
			if diff[1] == 0
				[what_week? + diff[0] - 1, 7]
			else 
				[what_week? + diff[0], day % 7]
			end
		end
end
