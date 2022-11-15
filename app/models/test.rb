class Test < ApplicationRecord

  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users  

=begin

  has_and_belongs_to_many :users

  def self.sort_test_titles_by_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = :category', category: category)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
=end
end