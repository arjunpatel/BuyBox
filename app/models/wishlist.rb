class Wishlist < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :product
end
