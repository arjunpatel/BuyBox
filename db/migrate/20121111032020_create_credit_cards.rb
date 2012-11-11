class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
	  t.integer "address_id"
	  t.integer "user_id"
	  t.integer "credit_card_number"
	  t.integer "exp_month"
	  t.integer "exp_year"
	  t.integer "cvc"
      t.timestamps
    end
	add_index("credit_cards", "address_id")
	add_index("credit_cards", "user_id")
  end
end
