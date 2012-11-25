class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery

  protected

  def layout_by_resource
    if params[:controller] == "devise/registrations" && params[:action] == "edit"
       "background_header"
    elsif devise_controller?
      "background_no_header"
    else
      "application"
    end
  end
end
