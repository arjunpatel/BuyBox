class UserReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :reviewer, :class_name => "User"
  # attr_accessible :title, :body
end
