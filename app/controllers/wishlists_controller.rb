class WishlistsController < ApplicationController
  before_filter :authenticate_user!
  def add
	@exists = Wishlist.where(:user_id => current_user.id, :product_id => params[:id])
	if @exists == []
		@wishlist = Wishlist.new
		@wishlist.user_id = current_user.id
		@wishlist.product_id = params[:id]
		if @wishlist.save
			redirect_to(:controller => 'products', :action => 'show', :id => params[:id])
		else
			render :file => File.join(Rails.root, 'public', '500.html')
		end
	else
		redirect_to(:controller => 'products', :action => 'show', :id => params[:id])
	end

  end
  def delete
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id != current_user.id
	  render :file => File.join(Rails.root, 'public', '500.html')
    else
      Wishlist.find(params[:id]).destroy
      redirect_to(:controller => 'users', :action => 'profile', :id => current_user.id)
    end
  end
end
