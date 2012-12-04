ActiveAdmin.register Category do

  index do                            
    column :id   
    column :category  
    column :created_at
    column :updated_at                            
    default_actions                   
  end   

 form do |f|                         
    f.inputs "Product Details" do       
      f.input :id
      f.input :Category  
    end                               
    f.buttons                         
  end  
end
