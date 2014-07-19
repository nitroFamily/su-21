class Admin::SettingsController < Admin::AdminController
	def index
    vk = VkontakteApi::Client.new(session[:token])
    @settings = Settings.unscoped
    if session[:vk_id]
      @user = vk.users.get(uid: session[:vk_id])
      @posts = vk.wall.get(fields: [])
    end
  end

  def edit
    @setting = Settings.unscoped.find(params[:id])
    @setting[:value] = YAML.load(@setting[:value])
  end

  def update 
  	@setting = Settings.unscoped.find(params[:id])
    @setting.var = params[:settings][:var]
    @setting.value = params[:settings][:value]

    if @setting.save
      # redirect_to admin_settings_path, notice: "Saved."
      flash.now[:success] = "Saved."
    else
      render "edit"
    end
  end
end
