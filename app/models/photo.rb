class Photo < ActiveRecord::Base

  #includes both static photos and videos

  belongs_to :user
  has_many :album_photos
  has_many :albums, :through => :album_photos

  has_attached_file :image, styles: { small: "80x53", med: "100x100", large: "200x200" }
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => "image/jpeg" }

  include Rails.application.routes.url_helpers

  def get_timestamp
  	EXIFR::JPEG.new(Rails.root.join(image.path).to_s).date_time
  end
  
  

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "caption" => read_attribute(:caption),
      "url" => image.url(:original),
      "thumbnail_url" => image.url(:small),
      "date" => read_attribute(:user_timestamp),
      "delete_url" => photo_path(self.id),
      "delete_type" => "DELETE",
      "id" => read_attribute(:id) 
    }
  end

end
