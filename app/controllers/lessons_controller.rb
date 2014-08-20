class LessonsController < ApplicationController
	include LessonsHelper
	before_action :set_day_info
	
	def day
		@lessons = LessonsDecorator.decorate(Lesson.get_by(day: @date_info.day, week: @date_info.week, periodicity: @date_info.periodicity),
																				 context: {week: @date_info.week, day: @date_info.day})
		# logger.debug @date_info.date.strftime("%e %b")
	end

	def week
		@lessons = Lesson.get_by(week: @current_week, periodicity: @periodicity)
	end

	private
		def set_day_info
			@date_info = DateInfo.new(params[:week], params[:day])
		end
end
