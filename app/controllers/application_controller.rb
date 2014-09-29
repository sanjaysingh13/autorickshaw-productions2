class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  helper_method :guest?
  
  protected
  def admin?
    
  session[:password] == ENV["ARP_ADMIN"]
  end
  def guest?
    session[:password] == ENV["ARP_GUEST"]
    
  end
  def authorize
  	unless admin?||guest?
  		flash.now[:error] = "unauthorized access"
  		#render films.index
  		false
  	end
  end
  

end
