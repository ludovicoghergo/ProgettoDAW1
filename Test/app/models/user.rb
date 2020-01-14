class User < ApplicationRecord
#  validates :fname, :lname, :email,:city,:state,:username, presence: true,
#                     length: { minimum: 2, maximum: 30}
#   validates :age,:zip, presence:true,
#                   numericality: { only_integer: true }
#   validates :email, uniqueness: true
#   validates :sex, presence:true
  has_secure_password
  has_many :comments
  has_many :products, through: :comments
end
