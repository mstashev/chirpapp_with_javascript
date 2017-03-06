class MessageSerializer < ActiveModel::Serializer
  attributes :body
  belongs_to :user
end
 
