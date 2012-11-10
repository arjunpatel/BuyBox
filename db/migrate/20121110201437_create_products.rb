class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.integer "user_id"
	  t.integer "category_id"
	  t.string "product_name"
	  t.text "description"
	  t.string "brand"
	  t.string "digital_link"
	  t.integer "popularity index"
	  t.float "price"
	  t.integer "quantity"
	  t.integer "quantity_sold"
      t.timestamps
    end
  end
end
