module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success_test?
	  'Тест пройден.'
	else
	  'Тест не пройден.'	
	end 
  end

  def color(test_passage)
    if test_passage.success_test?
	  'block_green'	  
	else
	  'block_red'	  	
	end 
  end		
end