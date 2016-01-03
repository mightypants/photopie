class UsersController < ApplicationController
  
  #layout "admin"
  
  before_action :confirm_logged_in

  def index
    # TODO if logged in user and not admin, redirect to 'show' page
    @users = User.all

  end

  def show
    @user = User.find(params[:id])    
    
    # Default album contains all photos not in another album
    # User page shows links to albums and all photos from default album
    @albums = @user.albums.where.not(:title => "default_user_album")
    default_album = @user.albums.where(:title => "default_user_album").first
    @photos = default_album.photos

    @albums.each do |a|
      puts "hello #{a.cover}"
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #create a default album, where all photos not belonging to a proper album will be stored
      default_album = Album.create(:title => "default_user_album", :visibility => 0, :is_pie_album => 0)
      album_user = AlbumUser.create(:album_id => default_album.id, :user_id => @user.id, access_type: 2)

      flash[:notice] = "User created successfully"
      redirect_to(:action => "index")
    else
      render("new")
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User #{@user.username} updated successfully"
      redirect_to(:action => "show", :id => @user.id)
    else
      render("edit")
    end

  end

  def delete
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User #{user.username} deleted successfully"
    redirect_to(:action => "index")
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :username, :password, :password_confirmation, :email)
    end
end
