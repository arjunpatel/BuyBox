class ProductsController < ApplicationController

  before_filter :authenticate_user!
  def list
    @user_id = current_user.id
	@products = Product.where(:user_id => @user_id).order("products.product_name ASC")
  end
  
  def show
	@product = Product.find(params[:id])
	if @product.user_id != current_user.id
	  redirect_to(:action => 'list')
	end
  end
  
  def new
	@product = Product.new
  end
  
  def create
	@product = Product.new(params[:product])
	@product.user_id = current_user.id
	if @product.save
	  redirect_to(:action => 'list')
	else
	  render('new')
	end
  end

end
