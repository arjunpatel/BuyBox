class Emailer < ActionMailer::Base
   def contact(email_params, sent_at = Time.now)
      @subject = 'buybox.com'
      @recipients = 'hsp009@ucsd.edu'
	  @body["full_name"] = email_params[:fullname]
      @from = email_params[:sender]
      @sent_on = sent_at
   	     @body["message"] = email_params[:message]
      @headers = {}
   end
end