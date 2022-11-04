class User < ApplicationRecord
  def test_passing(test_level)	 	
  	 Test.joins('JOIN users ON tests.author_id = users.id')
  	 	   .where('level = :level AND author_id = :author_id', level: test_level, author_id: user.id)
  	 	   .order('created_at ASC')
  end	
end


	