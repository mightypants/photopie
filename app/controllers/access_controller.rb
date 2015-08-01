class AccessController < ApplicationController
  
  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def index
  	# nothing yet
  end

  def login
  	# displays login form
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  	  found_user = User.where(:username => params[:username]).first
  	  if found_user
  	  	authorized_user = found_user.authenticate(params[:password])
  	  end
  	end
  	if authorized_user
  	  session[:user_id] = authorized_user.id
  	  session[:username] = authorized_user.username
  	  flash[:notice] = "Hurray, you did it."
  	  redirect_to(:controller => "user", :action => "show", :id => session[:user_id])
  	else
  	  flash[:notice] = "Y'all done messed up."
  	  redirect_to(action: "login") 
  	end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Y'all done logged out."	
    redirect_to(action: "login")
  end

end
