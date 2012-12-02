ActiveAdmin.register Category do
    index do                            
    column :id   
    column :category  
    column :created_at
    column :updated_at                            
    default_actions                   
  end   
end
