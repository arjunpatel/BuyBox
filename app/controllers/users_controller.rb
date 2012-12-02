class UsersController < ApplicationController
  layout "background_header"

  def profile
    @user = User.find(params[:id])
	@ownProfile = @user.id == current_user.id
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
