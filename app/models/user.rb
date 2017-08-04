class User < ApplicationRecord
  enum role: %I[guest user admin]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
