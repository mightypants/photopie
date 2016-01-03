class AlbumsController < ApplicationController
  
  include ActionView::Helpers::TextHelper

  before_action :confirm_logged_in

  def index
  end

  def show
    @album = Album.find(params[:id])
    dob = @album.subject_dob.to_date
    
    # slices are divisions of time, i.e. units of age: days, weeks, months, years
    @slices = []
    
    # TODO check for existing date
    @album.photos.each do |p| 
      days_old = p.user_timestamp? ? (p.user_timestamp.to_date - dob).to_i : -1
      weeks_old = 0
      months_old = 0
      years_old = 0
      display_age = ""

      # determine which unit to use for the age header
      case days_old
      when 0..84
        weeks_old = (days_old / 7).floor
        display_age = weeks_old == 0 ? "Newborn" : pluralize(weeks_old, "week")
      when 84..365
        months_old = (days_old / 30).floor
        display_age = pluralize(months_old, "month")
      when days_old > 730
        years_old = (days_old / 365).floor
        display_age = pluralize(years_old, "year")
      when -1
        display_age = "other"
      else
        puts "waaaaaaa?"
      end

      # either add the photo to an existing hash or create one if the
      # appropriate one doesn't exist
      if slice = @slices.find {|s| s[:display_age] == display_age }
        slice[:photos].push(p)
      else
        new_slice = {:days_old => days_old, :display_age => display_age, :photos => []}
        new_slice[:photos].push(p)
        @slices.push(new_slice)
      end      
    end  

    @slices.sort_by! {|h| h[:days_old]}

    # some portion of the slices and their photos will be loaded immediately,
    # others will be loaded as needed based on the view area of the screen
    @slices_initial = []
    @slices_lazy = []

    @slices.each do |s|
      if @slices.index(s) >= 1 # update with initial count calculations
        @slices_lazy.push(s)
      else 
        @slices_initial.push(s)
      end
    end

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
      redirect_to(:controller => "users", :action =>"show", :id => session[:user_id])
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

    def initial_slice_count
      1
    end


end
