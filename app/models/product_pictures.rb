class ProductPictures < ActiveRecord::Base
  belongs_to :product
  # attr_accessible :title, :body
end
