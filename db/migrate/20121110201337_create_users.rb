class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string "first_name"
	  t.string "last_name"
	  t.integer "phone_number"
	  t.integer "total_rating"
	  t.integer "number_of_ratings"
	  t.string "facebook_link"
	  t.string "twitter_link"
      t.timestamps
    end
  end
end
