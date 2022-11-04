# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   User :name, :age, :email, :score
#   Category :title
#   Test :title, :level, :category_id, :author_id
#   Question :body, :test_id
#   Answer  :body, :correct, :question_id

User.create ([
  { name: 'User1', age: 21, email: 'test@user1.com' },
  { name: 'User2', age: 31, email: 'test@user2.com' },
  { name: 'User3', age: 48, email: 'test@user3.com' },
  { name: 'User4', age: 31, email: 'test@user4.com' }
])

Category.create ([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Mobile' },
])

Test.create ([
  { 
    title: 'Ruby', 
	level: 0, 
	category_id: Category.where(title: 'Backend')[0].id, 
	author_id: User.where(name: "User4")[0].id
  },
  {
   	title: 'JS', 
	level: 2, 
	category_id: Category.where(title: 'Frontend')[0].id, 
	author_id: User.where(name: "User2")[0].id
  },
  {
   	title: 'JS 0 Level', 
	level: 0, 
	category_id: Category.where(title: 'Frontend')[0].id, 
	author_id: User.where(name: "User4")[0].id
  },
  {
    title: 'HTML', 
	level: 1, 
	category_id: Category.where(title: 'Mobile')[0].id, 
	author_id: User.where(name: "User3")[0].id 
  },
   {
    title: 'HTML', 
	level: 1, 
	category_id: Category.where(title: 'Mobile')[0].id, 
	author_id: User.where(name: "User3")[0].id 
  }
])

Question.create ([
  { 
  	body: 'What does HTML stand for?', 
  	test_id: Test.where(title: 'HTML')[0].id
  },
  { 
  	body: 'Inside which HTML element do we put the JavaScript?',
  	test_id: Test.where(title: 'JS')[0].id
  },
  { 
  	body: 'Consider the following irb quotes. After = > is the irb response. Which of the following answers is wrong?', 
  	test_id: Test.where(title: 'Ruby')[0].id
  }
])

Answer.create ([
  { 
    body: 'Hyperlinks and Text Markup Language', 
    question_id: Question.first.id
  },
  { 
  	body: 'Home Tool Markup Language', 
  	question_id: Question.first.id
  },
  { 
  	body: 'Hyper Text Markup Language', 
  	correct: true, 
  	question_id: Question.first.id
  },
  { 
  	body: '<javascript>',
  	question_id: Question.second.id
  },
  { 
  	body: '<p>', 
  	question_id: Question.second.id
  },
  { 
  	body: '<script>', 
  	correct: true, 
  	question_id: Question.second.id
  },
  { 
  	body: "irb(main):001:0> 'gin joint'.length => 9", 
  	question_id: Question.last.id
  },
  { 
  	body: "'hello'[2] => 'e'", 
  	correct: true, 
  	question_id: Question.last.id
  },
  { 
  	body: "'e'*3 => 'eee'", 
  	correct: true, 
  	question_id: Question.last.id 
  }
])
