class User < ActiveRecord::Base
  
  has_secure_password

  has_many :photos
  has_many :album_users # Users with access to the album
  has_many :albums, :through => :album_users

  EMAIL_REGEX = /\w{2,}@\w{2,}\.\w{2,}/
  validates :username, presence: true, 
  					   uniqueness: true, 
  					   length: {in: 4..16}
  validates :password, length: {in: 6..20}
  validates :password_confirmation, presence: true
  validates :email,    presence: true, 
  					   uniqueness: true, 
  					   format: {with: EMAIL_REGEX}, 
  					   length: {in: 8..30}

  scope :sorted, lambda { order("users.id ASC") }

end
