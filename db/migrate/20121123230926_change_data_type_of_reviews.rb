class ChangeDataTypeOfReviews < ActiveRecord::Migration
  def change
  	rename_column :reviews, :reviewer, :reviewer_id
  	change_table :reviews do |t|  
  	  t.change :reviewer_id, :integer
  	  t.change :rating, :integer
	end
  end
end
