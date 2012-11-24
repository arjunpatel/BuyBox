module ApplicationHelper
	
  def myself?(user_id)
    if (user_id && current_user && user_id == current_user.id) 
      return true
    else
      return false
    end
  end
end
