class AlterProducts < ActiveRecord::Migration
  def up
    add_column("products", "zip", :integer)
	rename_column("products", "popularity index", "popularity_index")
  end

  def down
	rename_column("products", "popularity_index", "popularity index")
    remove_column("products", "zip")
  end
end
