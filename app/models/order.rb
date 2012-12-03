class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # attr_accessible :title, :body
  def self.total_on(date, user_id)
  	products = User.find(user_id).products
  	orders = []
  	total = 0
  	products.each do |product|
  		orders = orders + product.orders
  	end
  	orders.each do |order|
  		if order.date_of_purchase == date
  			total = order.price
  		end
  	end

  	total
  end
end
