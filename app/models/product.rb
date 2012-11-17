class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :orders
  has_many :wishlists
  attr_accessible :product_name, :description, :brand, :price, :quantity, :zip, :category_id, :user_id, :digital_link, :popularity_index, :quantity_sold
end
