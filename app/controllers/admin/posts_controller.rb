class Admin::PostsController < Admin::AdminController
	helper_method :sort_column, :sort_direction

	def index 
		@posts = Post.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 10, page: params[:page])
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 
		@post = Post.new
	end

	def create 
		@post = Post.new(post_params)
  	if @post.save
  		flash[:success] = "Пост создан"
  		redirect_to admin_posts_path
  	else
  		render 'new'
  	end
	end

	def edit 
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		flash[:success] = "Обновлен"
  		redirect_to admin_posts_path
  	else
  		render 'edit'
  	end
	end

	def destroy
		@post = Post.find(params[:id]).destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Пост удален"
        redirect_to admin_posts_path
      end
      format.js { flash.now[:success] = "Пост удален" }
    end
	end

	private 
		def post_params
			params.require(:post).permit(:title, :text)
		end

		def sort_column
      Post.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
