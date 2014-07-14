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
			week = if params[:week].blank? then what_week? else params[:week].to_i end
			day = if params[:day].blank? then Time.now.wday else params[:day].to_i end
			[week, day]
		end
end
