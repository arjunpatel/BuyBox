class ReviewsController < ApplicationController

	def create
	    @user = User.find(params[:user_id])
	    @review = @user.reviews.create(params[:review])
	    redirect_to user_path(@user)
  	end

	def destroy
	    @user = User.find(params[:id])
	    @review = @user.reviews.find(params[:id])
	    @review.destroy
	    redirect_to user_path(@user)
	  end
end
