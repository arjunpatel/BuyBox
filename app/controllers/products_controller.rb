class ProductsController < ApplicationController
  layout "background_header"
  before_filter :authenticate_user!, :except => [:index, :show]

  @categories = Category.all
  def list
    @user_id = current_user.id
    @products = Product.where(:user_id => @user_id).order("products.product_name ASC")
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.limit(4)

    @seller= User.find(@product.user_id)
    render :layout => false
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

  def delete
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id
      redirect_to(:action => 'list')
    else
      Product.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.user_id = current_user.id
    if @product.update_attributes(params[:product])
      redirect_to(:action => 'list')
    else
      render('edit')
    end

  end

  def change_active
    product = Product.find(params[:id])
    if product.active == false
      product.active = true
    else
      product.active = false
    end
    product.save
    redirect_to(:action => 'list')
  end

  def index
    @search = Product.search(params[:search])
    @products = @search.where(:active => true) # or @search.relation to lazy load in view
  end


end
