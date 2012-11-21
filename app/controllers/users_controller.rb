class UsersController < ApplicationController
  layout "background_header"

  def show
    @user = User.find(params[:id])
  end

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

end
