class StaticPagesController < ApplicationController
	include LessonsHelper

	def home
		day_info = get_day_info
		@current_week = day_info[0]
		@current_day = day_info[1]
		periodicity = day_info[2]
		@when_lessons = "Сегодня"
		if Time.now.hour >= 18
			if @current_day >= 6
				@when_lessons = "В понедельник"
				@current_day = 1
				@current_week += 1
				periodicity = @current_week % 2 == 0 ? 2 : 1
			else 
				@when_lessons = "Завтра"
				@current_day += 1
			end
		end
		@lessons = Lesson.where("day = ? AND start_week <= ? AND end_week >= ? AND (periodicity = ? OR periodicity = 3)", 
											@current_day, 
											@current_week, 
											@current_week,
											periodicity)
											.order(number: :asc)
		@posts = Post.order(updated_at: :desc).limit(3)
	end
end
