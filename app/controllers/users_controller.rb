class UsersController < ApplicationController
  layout "background_header"

  def profile
    @user = User.find(params[:id])
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
    if (params[:facebook].present? && params[:twitter].present?)
      user = User.find(current_user.id)
      user.facebook_link = params[:facebook]
      user.twitter_link = params[:twitter]
      user.save
      @current_facebook = User.find(current_user.id).fb_url
      @current_twitter = User.find(current_user.id).twitter_link
    else
      @current_facebook = User.find(current_user.id).fb_url
      @current_twitter = User.find(current_user.id).twitter_link
    end
  end

end
