class User < ActiveRecord::Base
  belongs_to :location
  has_many :comments
  has_many :events, through: :attendances
  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence:true
end
