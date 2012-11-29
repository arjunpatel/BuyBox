class OrdersController < ApplicationController
  layout "background_header"
  before_filter :authenticate_user!

  def buy
  	order = Order.new
	order.product_id = params[:product_id]
	order.user_id = current_user.id
	order.price = params[:price]
	order.quantity = params[:quantity]
	order.date_of_purchase = Time.now
	product = Product.find(params[:product_id])
	if order.save && product.quantity >= Integer(params[:quantity])
	  flash[:notice] = "Your order was successful!"
	  product.quantity = product.quantity - Integer(params[:quantity])
	  if product.quantity == 0
		product.active = false
	  end
	  product.save
	  redirect_to(:controller => "products", :action => "list")
	else
	  render :file => File.join(Rails.root, 'public', '500.html')
	end

  end
  
end
