class HowlBarkbacksSerializer < ActiveModel::Serializer
  attributes :content
  belongs_to :howl
  belongs_to :user, serializer: HowlUserSerializer
end
