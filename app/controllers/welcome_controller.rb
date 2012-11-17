class WelcomeController < ApplicationController
  layout :resolve_layout

  def index
    #this is for applicaiton layout
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
