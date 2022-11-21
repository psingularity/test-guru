class User < ApplicationRecord

  validates :name, :email, presence: true

  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :authored_tests, class_name: 'Test', inverse_of: 'author'

  def tests_by_level(level)
    tests.where(level: level)
  end

end
