class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :email, presence:true
  validates :email, uniqueness: {case_sensitive: false}, format:{with: EMAIL_REGEX}
  validates :password, length: {minimum: 6}
end
