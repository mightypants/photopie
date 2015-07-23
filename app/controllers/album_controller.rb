class AlbumController < ApplicationController
  def index
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
  	@album = Album.new
  	@user = params[:id]
  end

  def create
  	@album = Album.new(album_params)
  	owner = User.find(params[:id])
  	# TODO: this is redundant; remove user_id from albums model
    @album.user_id = owner.id
    @album.users << owner

    if @album.save
      flash[:notice] = "Album created successfully"
      redirect_to(:controller => "user", :action => "show", :id => owner.id)
    else
      render("new")
    end
  end  

  def edit
  end

  private

    def album_params
      params.require(:album).permit(:title, :subject_first, :subject_last, :subject_middle, :subject_dob, :visibility)
    end
end
