class Post < ActiveRecord::Base
  belongs_to :dog
  acts_as_votable
  acts_as_commentable
  
  mount_uploader :attachment, AvatarUploader
end
