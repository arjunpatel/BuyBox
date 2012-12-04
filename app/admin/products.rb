ActiveAdmin.register Product do
    index do                            
    column :category_id   
    column :user_id                                
    column :id       
    column :product_name        
    column :description           
    column :brand
    column :digital_link
    column :popularity_index
    column :price
    column :quantity
    column :quantity_sold
    column :created_at
    column :updated_at
    column :zip 
    column :active
    default_actions                   
  end   

  form do |f|                         
    f.inputs "Product Details" do       
      f.input :category_id     
      f.input :user_id                               
      f.input :id               
      f.input :product_name  
      f.input :description                  
      f.input :brand               
      f.input :digital_link
      f.input :popularity_index
      f.input :price
      f.input :quantity
      f.input :quantity_sold
      f.input :zip 
      f.input :active
          default_actions                   

    end                               
    f.buttons                         
  end          
end
