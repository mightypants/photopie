class User < ActiveRecord::Base
  
  has_and_belongs_to_many :albums
  has_many :photos
  has_many :subjects

end