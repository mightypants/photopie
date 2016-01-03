class PhotosController < ApplicationController
  
  before_action :confirm_logged_in

  def index
    #this is all test stuff--index probably not used
    @photo = Photo.first
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def new
  	@photo = Photo.new
  	@user = User.find(session[:user_id])
  	
  	if params[:id]
  	  @album = Album.find(params[:id])
    else
      @album = @user.albums.where(:title => "default_user_album").first  
  	end	

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = User.find(session[:user_id])

    respond_to do |format|
      if @photo.save      
        # Create the album/photo relationship
        album_photo = AlbumPhoto.create(:photo_id => @photo.id, :album_id => params[:album_id])
        
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload]}, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def edit
    if params[:id]
      @photos = Photo.where(:id => params[:id])
    else
      @photos = Photo.where(:user_id => session[:user_id], :user_timestamp => nil)
    end
  end

  def update
    photos = params[:photos]
    photos.each do |p|
      photo_entry = Photo.find(p[0])
      photo_entry.caption = p[1]["caption"]
      photo_entry.user_timestamp = p[1]["user_timestamp"]
      photo_entry.save
    end
    redirect_to(:controller => "users", :action => "index")
  end  
  
  def destroy
    user = Photo.find(params[:id]).destroy
    #flash[:notice] = "User #{user.username} deleted successfully"
    #redirect_to(:action => "index")
  end

  private

    def photo_params
      params.require(:photo).permit(:caption, :image, :user_timestamp)
    end


end
