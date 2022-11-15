class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :tests, inverse_of: 'author'

=begin 

  has_and_belongs_to_many :tests
  def user_tests(level)
    Test.joins('JOIN users_tests ON tests.id = users_tests.test_id')
        .where('tests.level = :level AND users_tests.user_id = :user_id',
               level: level, user_id: id)
  end
=end
end
