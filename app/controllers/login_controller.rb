class LoginController < ApplicationController
  
  def login
  	@j = User.first
  	@p = Photo.first


  end

end
