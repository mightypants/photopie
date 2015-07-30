class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :album_photos
  has_many :albums, :through => :album_photos

end
