class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  helper_method :guest?
  helper_method :vimeofilms
  helper_method :filmist
  helper_method :documentaries
  helper_method :shortfilm
  helper_method :musicvideos
  helper_method :adfilms
  helper_method :behindthescenes
  helper_method :weddings
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
  def filmlist
    @filmlist = Film.all

   end 
   def documentaries
   @documentaries = [] 
    Film.all.each do |film|
        if film.name == "D" 
        @documentaries << film.url
        end
        @documentaries
    end    
    end
    def shortfilm   
   @shortfilm = [] 
    Film.all.each do |film|
        if film.name == "S" 
        @shortfilm << film.url
        end
        @shortfilm
    end    
    end
    def musicvideos
   @musicvideos = [] 
    Film.all.each do |film|
        if film.name == "M" 
        @musicvideos << film.url
        end
        @musicvideos
    end    
    end
    def behindthescenes
   @behindthescenes = [] 
    Film.all.each do |film|
        if film.name == "B" 
        @behindthescenes << film.url
        end
        @behindthescenes
    end    
    end
    def adfilms
   @adfilms = [] 
    Film.all.each do |film|
        if film.name == "A" 
        @adfilms << film.url
        end
        @adfilms
    end    
    end
    def weddings
   @weddings = [] 
    Film.all.each do |film|
        if film.name == "W" 
        @weddings << film.url
        end
        @weddings
    end    
    end



end
