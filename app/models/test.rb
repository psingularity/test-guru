class Test < ApplicationRecord

  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users  

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

end
