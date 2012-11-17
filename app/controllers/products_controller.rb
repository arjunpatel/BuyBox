class ProductsController < ApplicationController

  before_filter :authenticate_user!
  def list
    @user_id = current_user.id
	@products = Product.where(:user_id => @user_id).order("products.product_name ASC")
  end
  
  def show
	@product = Product.find(params[:id])
  end
end
