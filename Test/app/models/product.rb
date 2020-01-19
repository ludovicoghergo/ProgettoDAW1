class Product < ApplicationRecord
  has_many :comments
  has_many :orders
  has_many :users, through: :comments
  has_many :users, through: :orders
end
