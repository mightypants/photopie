class Album < ActiveRecord::Base

  has_many :album_photos
  has_many :photos, :through => :album_photos
  has_many :album_users # Users with access to the album
  has_many :users, :through => :album_users

end
