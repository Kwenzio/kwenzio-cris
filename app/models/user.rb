class User < ApplicationRecord
  has_secure_password algorithm: :argon2
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
