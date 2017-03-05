require 'uri'

class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token

  has_many :messages

  validates :username_email, presence: true, uniqueness: true
  validates :avatar_url, require: false
  validates :avatar_url, format: { with: URI.regexp }, if: 'avatar_url.present?'

  acts_as_follower
  acts_as_followable
end
