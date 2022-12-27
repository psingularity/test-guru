class User < ApplicationRecord

  validates :name, :email, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: 'Test', inverse_of: 'author'

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
