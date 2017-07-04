class Post < ActiveRecord::Base
  belongs_to :dog
  acts_as_votable
  acts_as_commentable

  mount_uploader :attachment, AvatarUploader

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_dog }
end
