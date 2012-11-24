class Review < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :rating, :reviewer_id
   validates :rating,  :presence => true
   validates :comment,  :presence => true,
   						:length => { :minimum => 10 }
end
