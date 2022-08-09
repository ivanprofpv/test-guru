Admin.create(
  email: 'admin@testguru.com',
  password: '12345',
  password_confirmation: '12345',
  first_name: "FirstName",
  last_name: "LastName",
  confirmed_at: Time.zone.now
)

3.times do |i|
  User.create(
    email: "email-#{i}@mail.com",
    password: '1234',
    password_confirmation: '1234',
    first_name: "First_name_#{i}",
    last_name: "Last_name_#{i}",
    confirmed_at: Time.zone.now
  )
end

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = backend.tests.create(title: 'Ruby', level: 3)
go_test = backend.tests.create(title: 'Go', level: 2)
html_test = fronted.tests.create(title: 'HTML', level: 1)
css_test = fronted.tests.create(title: 'CSS', level: 1)
js_test = mobile.tests.create(title: 'JS', level: 2)
swift_test = mobile.tests.create(title: 'Swift', level: 3)

ruby_question = ruby_test.questions.create(title: 'Ruby its Backend language?')
go_question = go_test.questions.create(title: 'Go its Backend language?')
html_question = html_test.questions.create(title: 'HTML its Fronted language?')
css_question = css_test.questions.create(title: 'CSS its Fronted language?')
js_question = js_test.questions.create(title: 'JS its Mobile language?')
swift_question = swift_test.questions.create(title: 'Swift its Mobile language?')

ruby_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
go_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
html_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
css_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
js_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
swift_question.answers.create([
                {title: 'Yes', question_id: questions[0].id, correct: true},
                {title: 'No', question_id: questions[0].id, correct: false}
              ])
