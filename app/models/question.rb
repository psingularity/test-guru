class Question < ApplicationRecord
  validates :body, presence: true
  validate :answers_count

  belongs_to :test
  has_many :answers 

  private

  def answers_count
    errors.add(:answers, 'One question can have from 1 to 4 answers') unless (1..4).include?(answers.count)
  end 
end
