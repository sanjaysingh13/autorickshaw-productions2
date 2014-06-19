class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  helper_method :guest?
  helper_method :vimeofilms
  protected
  def admin?
    Rails.logger.debug "Session password is #{session[:password]}"
    Rails.logger.debug "Stored password is #{ENV["ARP_ADMIN"]}"
  session[:password] == ENV["ARP_ADMIN"]
  end
  def guest?
    session[:password] == ENV["ARP_GUEST"]
    
  end
  def authorize
  	unless admin?||guest?
  		flash[:error] = "unauthorized access"
  		#render films.index
  		false
  	end
  end
  def vimeofilms
    @vimeofilms = Vimeo::Simple::User.videos("autorickshawproductions")
  end

end
