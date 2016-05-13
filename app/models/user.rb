class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, length: { minimum: 8 }, allow_nil: true
end
