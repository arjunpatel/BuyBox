class UsersController < ApplicationController
  layout "background_header"
  before_filter :authenticate_user!, :except => [:profile]
  def profile
    @user = User.find(params[:id])
	if(current_user)
		@ownProfile = @user.id == current_user.id
	else
		@ownProfile = false
	end
    @products = Product.where(:user_id => params[:id], :active => true).order("products.product_name ASC")
	@wishlists = Wishlist.where(:user_id => params[:id])
    render :layout => false
  end

  def account_settings

  end

  def sales

  end

  def purchases

  end

  def messages

  end

  def buyer_information
  user = User.find(current_user.id)
  addresses = Address.where(:user_id => current_user.id)
  address= addresses[0]
  @user = User.find(current_user.id)
  @addresses = Address.where(:user_id => current_user.id)
  @address= addresses[0]

  if (address)
    if (params[:sub_value].present?)
      address.user_id = current_user.id
      address.line1 = params[:line1]
      address.line2 = params[:line2]
      address.city = params[:city]
      address.state = params[:state]
      address.zip = params[:zip]
      address.save
      @user_address_line1 = address.line1
      @user_address_line2 = address.line2
      @user_address_city = address.city
      @user_address_state = address.state
      @user_address_zip = address.zip
      redirect_to "/users/buyer_information"
    else
      @user_address_line1 = address.line1
      @user_address_line2 = address.line2
      @user_address_city = address.city
      @user_address_state = address.state
      @user_address_zip = address.zip
    end
  else
      address = Address.new
    if (params[:sub_value].present?)
      user = User.find(current_user.id)
      address.user_id = current_user.id
      address.line1 = params[:line1]
      address.line2 = params[:line2]
      address.city = params[:city]
      address.state = params[:state]
      address.zip = params[:zip]
      if address.save
        flash[:notice] = "Your address has been save!"
      else
        flash[:notice] = "Something went wrong. Please contact us"
      end
      address.save
      @user_address_line1 = user.address.line1
      @user_address_line2 = user.address.line2
      @user_address_city = user.address.city
      @user_address_state = user.address.state
      @user_address_zip = user.address.zip
    end
  end

  end

  def connection
    if (params[:sub_val].present?)
      user = User.find(current_user.id)
      user.facebook_link = params[:facebook]
      user.twitter_link = params[:twitter]
      user.save
      @current_facebook = User.find(current_user.id).facebook_link
      @current_twitter = User.find(current_user.id).twitter_link
    else
      @current_facebook = User.find(current_user.id).facebook_link
      @current_twitter = User.find(current_user.id).twitter_link
    end
  end

end
