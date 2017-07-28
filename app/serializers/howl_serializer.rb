class HowlSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image
  belongs_to :user, serializer: HowlUserSerializer
  has_many :barkbacks, serializer: HowlBarkbacksSerializer
end
