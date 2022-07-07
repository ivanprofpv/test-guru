10.times do |i|
  User.create(
    login: "User-#{i}",
    password: "1234_#{i}"
  )
end

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = Test.create(title: 'Ruby', level: 3, category_id: 1)
go_test = Test.create(title: 'Go', level: 2, category_id: 1)
html_test = Test.create(title: 'HTML', level: 1, category_id: 2)
css_test = Test.create(title: 'CSS', level: 1, category_id: 2)
js_test = Test.create(title: 'JS', level: 2, category_id: 3)
swift_test = Test.create(title: 'Swift', level: 3, category_id: 3)

ruby_question = Question.create(title: 'Ruby its Backend language?', test_id: 1)
go_question = Question.create(title: 'Go its Backend language?', test_id: 2)
html_question = Question.create(title: 'HTML its Fronted language?', test_id: 3)
css_question = Question.create(title: 'CSS its Fronted language?', test_id: 4)
js_question = Question.create(title: 'JS its Mobile language?', test_id: 5)
swift_question = Question.create(title: 'Swift its Mobile language?', test_id: 6)

Answer.create([
                {title: 'Yes', question_id: 1, correct: true},
                {title: 'No', question_id: 1, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: 2, correct: true},
                {title: 'No', question_id: 2, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: 3, correct: true},
                {title: 'No', question_id: 3, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: 4, correct: true},
                {title: 'No', question_id: 4, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: 5, correct: true},
                {title: 'No', question_id: 5, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: 6, correct: true},
                {title: 'No', question_id: 6, correct: false}
              ])

user_passed_tests1 = TestsPassed.create(id_tests: 1, id_users: 1)
user_passed_tests2 = TestsPassed.create(id_tests: 2, id_users: 1)
