module TestsHelper
  TEST_LEVELS = { 0 => 'легкий', 1 => 'элементарный', 2 => 'продвинутый'}.freeze

  TEST_CATEGORIES = { 1 => 'Frontend', 2 => 'Backend'}

  def test_level(test)
    TEST_LEVELS[test.level] || 'героический'
  end

  def test_category(test)
    TEST_CATEGORIES[test.category_id] || 'Mobile'
  end
end