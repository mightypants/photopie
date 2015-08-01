class Photo < ActiveRecord::Base

  #includes both static photos and videos

  belongs_to :user
  has_many :album_photos
  has_many :albums, :through => :album_photos

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => "image/jpeg" }
end
