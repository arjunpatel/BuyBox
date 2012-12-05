class CreditCardsController < ApplicationController
	before_filter :authenticate_user!
	def new
		if current_user.credit_card
			@credit_card = current_user.credit_card
			@new = false
		else
			@credit_card = CreditCard.new
			@new = true
		end
		@credit_card.user_id = current_user.id
		@credit_card.credit_card_number = params[:card_number]
		@credit_card.cvc = params[:cvc]
		@credit_card.exp_month = params[:exp_month]
		@credit_card.exp_year = params[:exp_year]
		if @credit_card.save
			if @new
				flash[:notice] = "You have successfully added your credit card information"
			else
				flash[:notice] = "You have successfully updated your credit card information"
			end
			
			redirect_to(:controller => "users", :action => "buyer_information")
		else
			render :file => File.join(Rails.root, 'public', '500.html')
		end
	end
end
