10.times do |i|
  User.create(
    login: "User-#{i}",
    password: "1234_#{i}"
  )
end

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = Test.create(title: 'Ruby', level: 3, category_id: categories[0].id)
go_test = Test.create(title: 'Go', level: 2, category_id: categories[0].id)
html_test = Test.create(title: 'HTML', level: 1, category_id: categories[0].id)
css_test = Test.create(title: 'CSS', level: 1, category_id: categories[0].id)
js_test = Test.create(title: 'JS', level: 2, category_id: categories[0].id)
swift_test = Test.create(title: 'Swift', level: 3, category_id: categories[0].id)

ruby_question = Question.create(title: 'Ruby its Backend language?', test_id: tests[0].id)
go_question = Question.create(title: 'Go its Backend language?', test_id: tests[0].id)
html_question = Question.create(title: 'HTML its Fronted language?', test_id: tests[0].id)
css_question = Question.create(title: 'CSS its Fronted language?', test_id: tests[0].id)
js_question = Question.create(title: 'JS its Mobile language?', test_id: tests[0].id)
swift_question = Question.create(title: 'Swift its Mobile language?', test_id: tests[0].id)

Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
Answer.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])

user_passed_tests1 = TestsPassed.create(id_tests: tests_passeds[0].id, id_users: tests_passeds[0].id)
user_passed_tests2 = TestsPassed.create(id_tests: tests_passeds[0].id, id_users: tests_passeds[0].id)
