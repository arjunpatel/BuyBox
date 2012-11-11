class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
	  t.integer "user_id"
	  t.integer "reviewer_id"
	  t.text "review"
	  t.integer "rating"
      t.timestamps
    end
	add_index("user_reviews", "user_id")
	add_index("user_reviews", "reviewer_id")
  end
end
