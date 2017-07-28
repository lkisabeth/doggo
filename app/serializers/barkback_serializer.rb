class BarkbackSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
  belongs_to :howl
end
