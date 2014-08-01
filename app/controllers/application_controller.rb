class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :prepare_for_mobile
  
  private 
  	def mobile_device?
  		request.user_agent =~ /Android|iPad/
  	end

  	def prepare_for_mobile
  		request.format = :mobile if mobile_device?
  	end
end
