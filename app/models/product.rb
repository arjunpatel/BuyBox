class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :orders
  has_many :wishlists
  # attr_accessible :title, :body
end
