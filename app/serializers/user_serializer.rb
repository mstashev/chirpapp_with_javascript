class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url ,:api_token
  has_many :messages
end
