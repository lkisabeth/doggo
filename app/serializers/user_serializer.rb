class UserSerializer < ActiveModel::Serializer
  attributes :id, :human_name, :doggo_name, :bio
  has_many :howls
  has_many :barkbacks
end
