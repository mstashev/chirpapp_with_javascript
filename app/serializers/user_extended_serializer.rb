class UserExtendedSerializer < ActiveModel::Serializer
  attributes :name, :username_email, :avatar_url, :api_token
  has_many :messages
end
