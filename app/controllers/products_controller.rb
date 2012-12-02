class ProductsController < ApplicationController
  layout :layout_by_resource
  before_filter :authenticate_user!, :except => [:index, :show, :show_qr]

  @categories = Category.all
  def list
    @user_id = current_user.id
    @products = Product.where(:user_id => @user_id).order("products.product_name ASC")

  end

  def show
	if current_user != nil
		@user_id = current_user.id
	end
    @product = Product.find(params[:id])
    @products = Product.where(:category_id => @product.category_id)
    @seller= User.find(@product.user_id)   
	@seller_id = @seller.id

    render :layout => false
  end
  def show_qr
    @product = Product.find(params[:id])
    @products = Product.where(:category_id => @product.category_id)
    @seller= User.find(@product.user_id)

    render :layout => false
  end

  def new
    @product = Product.new
    @user = current_user
    render :layout => false

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
	  render :file => File.join(Rails.root, 'public', '500.html')
    else
      Product.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end
  end

  def edit
    @product = Product.find(params[:id])
    @user = current_user
	render :layout => false
	if @product.user_id != current_user.id
	  render :file => File.join(Rails.root, 'public', '500.html')
	end
  end

  def update
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id
	  render :file => File.join(Rails.root, 'public', '500.html')
    end
    if @product.update_attributes(params[:product])
      redirect_to(:action => 'list')
    else
      render('edit')
    end

  end

  def change_active
    product = Product.find(params[:id])
	if product.user_id != current_user.id
	  render :file => File.join(Rails.root, 'public', '500.html')
    else
		if product.active == false
			product.active = true
		else
			product.active = false
		end
		product.save
		redirect_to(:action => 'list')
	end
  end

  def buybox_genie
    require 'net/http'
    result = Net::HTTP.get(URI.parse("http://priceonomics.com/api/v1/search/?query=#{Rack::Utils.escape(params[:query_params])}"))
    parsed_json = ActiveSupport::JSON.decode(result)
    total = 0
    parsed_json["results"].each do |product|
      total += product["price_estimate"]
    end
    render :text => "$ #{(total/parsed_json["results"].size).ceil}"
  end

  def index
    @search = Product.search(params[:search])
    @products = @search.where(:active => true) # or @search.relation to lazy load in view

  end

  protected


  def layout_by_resource
    if params[:action] == "index"
       "application"
    else
      "background_header"
    end
  end


end
