require 'digest/sha1'

class User < ApplicationRecord

  # include Auth  

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: 'Test', inverse_of: 'author'

  #validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true


  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end  
end
