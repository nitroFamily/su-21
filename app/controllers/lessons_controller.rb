class LessonsController < ApplicationController
	include LessonsHelper

	def day
		# @lessons = Lesson.find_by_day(params[:day])
		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @lessons }
		# end
		current_day = Time.now.wday
		current_week = what_week?
		# @lessons = Lesson.where(day: current_day, start_week: current_week)
	end

	def week

	end
end
