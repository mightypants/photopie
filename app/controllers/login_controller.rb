class LoginController < ApplicationController
  
  def index
  	@j = User.first
  	@p = Photo.first


  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  	  found_user = User.where(:username => params[:username])
  	  if found_user
  	  	authorized_user = found_user.authenticate(params[:password])
  	  end
  	end
  	if authorized_user
  	  flash[:notice] = "Hurray, you did it."
  	  redirect_to(:controller => "users", :action => "show", :id => authorized_user.id)
  	else
  	  flash[:notice] = "Y'all done messed up."
  	  redirect_to(:action => "login") 
  	end
  end

  def logout
    flash[:notice] = "Y'all done logged out."	
    redirect_to(:action => "login")
  end
end
