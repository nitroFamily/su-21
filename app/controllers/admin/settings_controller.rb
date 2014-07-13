class Admin::SettingsController < Admin::AdminController
	def index
    @settings = Settings.unscoped
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
      redirect_to admin_settings_path, notice: "Saved."
    else
      render "edit"
    end
  end
end
