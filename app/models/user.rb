class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :diaries, :dependent => :delete_all
  has_secure_password
end
