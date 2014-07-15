namespace :db do
	desc "Fill database with sample data"
	task create_lessons: :environment do
		30.times do |i|
			Lesson.create!(name: "#{(i+65).chr}esson-#{i}",
      							 form: "#{i%3+1}",
      							 number: "#{i%5+1}",
      							 classroom: "#{100+i}/1",
      							 day: "#{i%7+1}",
      							 start_week: 1,
      							 end_week: 18,
      							 periodicity: i%3+1)
		end
	end
end