class SessionsController < ApplicationController

def create
session[:password] = params[:password]
flash.now[:notice] = "Successfully logged in"
redirect_to root_path
end
def destroy
	reset_session
	flash.now[:notice] = "Successfully logged out"
	redirect_to root_path
end
 
end
