class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	  t.integer "product_id"
	  t.integer "user_id"
	  t.integer "price"
	  t.integer "quantity"
	  t.date "date_of_purchase"
	  t.string "order_status"
	  t.integer "tracking_number"
      t.timestamps
    end
  end
end
