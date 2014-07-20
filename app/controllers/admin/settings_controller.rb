class Admin::SettingsController < Admin::AdminController
	def index
    @date = Settings.unscoped.find_by(var: "date")
    vk = VkontakteApi::Client.new(Settings.token)
    if Settings.vk_id
      @user = vk.users.get(uid: Settings.vk_id)
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
