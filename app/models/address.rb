class Address < ActiveRecord::Base
  belongs_to :user
  has_one :credit_card
  # attr_accessible :title, :body
end
