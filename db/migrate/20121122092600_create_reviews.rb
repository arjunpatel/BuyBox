class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :rating
      t.text :comment
      t.references :user
      t.timestamps
    end
    add_index :reviews, :user_id
  end
end
