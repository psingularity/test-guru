class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :tests, inverse_of: 'author'

end
