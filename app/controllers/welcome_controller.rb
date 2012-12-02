class WelcomeController < ApplicationController
  layout :resolve_layout

  def index
    @products = Product.find(:all, :limit => 16)
  end

  def search
    render :layout => false
  end

  def background_header

  end

  def background_no_header

  end


  private

  def resolve_layout
    case action_name
    when "background_header"
      "background_header"
    when "background_no_header"
      "background_no_header"
    else
      "application"
    end
  end

end
