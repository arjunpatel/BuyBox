class AddColumnToProducts < ActiveRecord::Migration
  def change
	add_column("products", "active", :boolean, :default => true, :null => false)
  end
end
