class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :rating
      t.text :comment
      t.references :user
      t.timestamps
    end
    add_index :reviews, :user_id
  end
end
