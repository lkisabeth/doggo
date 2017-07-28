class Barkback < ApplicationRecord
  belongs_to :user
  belongs_to :howl

  acts_as_votable
end
