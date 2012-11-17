class AlterProducts < ActiveRecord::Migration
  def up
    add_column("products", "zip", :integer)
  end

  def down
  end
end
