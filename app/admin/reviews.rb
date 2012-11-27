ActiveAdmin.register Review do
    index do                            
    column :user_id                     
    column :reviewer_id        
    column :rating           
    column :comment             
    default_actions                   
  end   
end
