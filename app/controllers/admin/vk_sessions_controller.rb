class Admin::VkSessionsController < Admin::AdminController
	def new
    srand
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)
    
    @vk_url = VkontakteApi.authorization_url(scope: [:groups], state: session[:state])
  end
  
  def callback
    redirect_to admin_path, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return if session[:state].present? && session[:state] != params[:state]
    
    @vk = VkontakteApi.authorize(code: params[:code])
    Settings.token = @vk.token
    Settings.vk_id = @vk.user_id
    
    redirect_to admin_path
  end
  
  def destroy
    Settings.token = nil
    Settings.vk_id = nil
    
    redirect_to admin_path
  end
end
