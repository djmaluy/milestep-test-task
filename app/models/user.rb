class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :email


  has_secure_password
  has_many :tasks,  dependent: :destroy
  self.per_page = 5
  has_one_attached :image
end
