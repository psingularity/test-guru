# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => 'легкий', 1 => 'элементарный', 2 => 'продвинутый' }.freeze

  TEST_CATEGORIES = { 1 => 'Frontend', 2 => 'Backend' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'героический'
  end

  def test_category(test)
    TEST_CATEGORIES[test.category_id] || 'Mobile'
  end

  def test_header(test)
    if test.new_record?
      'Создать новый тест'
    else
      "Редактировать #{test.title} тест"
    end
  end
end
