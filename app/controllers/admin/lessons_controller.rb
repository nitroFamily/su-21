class Admin::LessonsController < Admin::AdminController
	def index 
    @lessons = Lesson.all
	end 

	def new 
		@lesson = Lesson.new
	end

	def create
		@lesson = Lesson.new(lesson_params)
  	if @lesson.save
  		flash[:success] = "Пара создана"
  		redirect_to admin_lessons_path
  	else
  		render 'new'
  	end
	end

  def edit 
    @lesson = Lesson.find(params[:id])
  end

  def update 
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      flash[:success] = "Занятие обновлено"
      redirect_to admin_lessons_path
    else
      render 'edit'
    end
  end

  def destroy
    Lesson.find(params[:id]).destroy
    flash[:success] = "Пара удалена"
    redirect_to admin_lessons_path
  end

	private
    def lesson_params
      params.require(:lesson).permit(:name,
      															 :form,
      															 :number,
      															 :classroom,
      															 :day,
      															 :start_week,
      															 :end_week,
      															 :periodicity)
    end
end
