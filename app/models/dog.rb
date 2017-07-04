class Dog < ActiveRecord::Base
  belongs_to :user
  acts_as_follower
  acts_as_followable
  
end
