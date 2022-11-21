class Test < ApplicationRecord

  INFINITE_LEVEL = Float::INFINITY

  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users 

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4)}
  scope :difficult, -> { by_level(5..INFINITE_LEVEL) }

  scope :by_level, -> (level) { where(level: level) }

  scope :by_category, -> (category) {joins(:category).where(categories: { title: category }) } 

  def self.sort_test_titles_by_category(category)
    by_category(category).order(title: :DESC).pluck(:title)
  end
 
=begin
  
  def self.sort_test_titles_by_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = :category', category: category)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
=end
end
