class UserController < ApplicationController
  
  #layout "admin"
  
  before_action :confirm_logged_in

  def index
    # TODO if logged in user and not admin, redirect to 'show' page
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
    @albums = @user.albums
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
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
