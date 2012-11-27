class Review < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :rating, :reviewer_id
   validates :rating,  :presence => { :message => "Rating is required" }
   validates :comment,  :length => { :minimum => 10, :message => 'should be between 5 and 40 characters' }
   						



end
