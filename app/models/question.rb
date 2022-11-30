class Question < ApplicationRecord
  MAX_ANSWERS = 4
  validates :body, presence: true
  validate :validate_max_answers

  belongs_to :test
  has_many :answers 

  private

  def validate_max_answers
    errors.add(:answers, 'One question can have from 1 to 4 answers') if answers.count > MAX_ANSWERS
  end 
end
