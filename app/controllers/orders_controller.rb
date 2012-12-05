class OrdersController < ApplicationController
  layout "background_header"
  before_filter :authenticate_user!

  def buy
	if current_user.address and current_user.credit_card
		order = Order.new
		order.product_id = params[:product_id]
		order.user_id = current_user.id
		order.price = params[:price]
		order.quantity = params[:quantity]
		order.date_of_purchase = Time.now - 8.hours
		order.order_status = "Not Shipped"
		product = Product.find(params[:product_id])
		if order.save && product.quantity >= Integer(params[:quantity])
			product.quantity = product.quantity - Integer(params[:quantity])
			if product.quantity == 0
				product.active = false
			end
			product.save
			redirect_to(:controller => "orders", :action => "confirmation", :id => order.id)
		else
			render :file => File.join(Rails.root, 'public', '500.html')
		end
	else
		flash[:notice] = "You need to fill in your address/credit card information before purchasing a product"
		redirect_to(:controller => "users", :action => "buyer_information")
	end

  end
  
  def sold
    products = User.find(current_user.id).products
	@orders = []
	products.each do |product|
		@orders = @orders + product.orders
	end
  end
  
  def purchased
	@orders = Order.where(:user_id => current_user.id)
  end
  def overview
	@user_id = current_user.id
  end
  def changeStatus
    @order = Order.find(params[:id])
	@order.order_status = "Shipped"
	@order.save
    redirect_to(:action => "sold")
  end
  
  def confirmation
	@order = Order.find(params[:id])
	if @order.user != current_user
		render :file => File.join(Rails.root, 'public', '500.html')
	end
	@product = @order.product
	@buyer = current_user
	@seller = @product.user
  end
  
end
