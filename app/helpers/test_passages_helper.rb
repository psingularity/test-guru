module TestPassagesHelper
  def test_result(test_passage)
    t("test_passages.#{test_passage.success_test? ? 'success' : 'failure'}").html_safe
  end

  def color(test_passage)
    test_passage.success_test? ? 'block_green' : 'block_red'
  end
end
