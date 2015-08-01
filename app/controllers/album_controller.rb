class AlbumController < ApplicationController
  
  before_action :confirm_logged_in

  def index
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
  	@album = Album.new
  	@user = session[:user_id]
  end

  def create
  	@album = Album.new(album_params)

    if @album.save
      # Create the join table entry and assign access type of owner
      album_user = AlbumUser.create(:album_id => @album.id, :user_id => session[:user_id], access_type: 2)
      flash[:notice] = "Album created successfully"
      redirect_to(:controller => "user", :action =>"show", :id => session[:user_id])
    else
      render("new")
    end

  end  

  def edit
  end

  private

    def album_params
      params.require(:album).permit(:title, :subject_first, :subject_last, :subject_middle, :subject_dob, :visibility, :is_pie_album)
    end
end
