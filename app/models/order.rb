class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # attr_accessible :title, :body
  def self.total_on(date)
  	Order.where("date(date_of_purchase) = ?", date).sum(:price)
  end
end
