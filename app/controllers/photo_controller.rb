class PhotoController < ApplicationController
  
  before_action :confirm_logged_in

  def new(album=nil)
  	@photo = Photo.new
  	@user = session[:user_id]
  	
  	if album
  	  @album = album
  	end	

  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = User.find(session[:user_id])

    if @photo.save
      flash[:notice] = "Album created successfully"
      redirect_to(:controller => "user", :action =>"show", :id => session[:user_id])
    end
  end
  

  def edit
  end

  private

    def photo_params
      params.require(:photo).permit(:caption, :image)
    end


end
