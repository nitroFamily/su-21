class Admin::LessonsController < Admin::AdminController
  helper_method :sort_column, :sort_direction

	def index 
    @lessons = Lesson.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 10, page: params[:page])
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
    @lesson = Lesson.find(params[:id]).destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Пара удалена"
        redirect_to admin_lessons_path
      end
      format.js
    end
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

    def sort_column
      Lesson.column_names.include?(params[:sort]) ? params[:sort] : "day"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
