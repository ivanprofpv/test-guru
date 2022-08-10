Admin.create!(
  email: 'admin@testguru.com',
  password: '1234567',
  password_confirmation: '1234567',
  type: "Admin",
  first_name: "FirstName",
  last_name: "LastName",
  confirmed_at: Time.zone.now
)

3.times do |i|
  User.create!(
    email: "email-#{i}@mail.com",
    password: '1234567',
    password_confirmation: '1234567',
    first_name: "First_name_#{i}",
    last_name: "Last_name_#{i}",
    confirmed_at: Time.zone.now
  )
end

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = backend.tests.create!(title: 'Ruby', level: 3, author_id: 1)
go_test = backend.tests.create(title: 'Go', level: 2, author_id: 1)
html_test = fronted.tests.create(title: 'HTML', level: 1, author_id: 1)
css_test = fronted.tests.create(title: 'CSS', level: 1, author_id: 1)
js_test = mobile.tests.create(title: 'JS', level: 2, author_id: 1)
swift_test = mobile.tests.create(title: 'Swift', level: 3, author_id: 1)

ruby_question = ruby_test.questions.create(title: 'Ruby its Backend language?')
go_question = go_test.questions.create(title: 'Go its Backend language?')
html_question = html_test.questions.create(title: 'HTML its Fronted language?')
css_question = css_test.questions.create(title: 'CSS its Fronted language?')
js_question = js_test.questions.create(title: 'JS its Mobile language?')
swift_question = swift_test.questions.create(title: 'Swift its Mobile language?')

ruby_question.answers.create([
                {body: 'Yes', question_id: 1, correct: true},
                {body: 'No', question_id: 1, correct: false}
              ])
go_question.answers.create([
                {body: 'Yes', question_id: 2, correct: true},
                {body: 'No', question_id: 2, correct: false}
              ])
html_question.answers.create([
                {body: 'Yes', question_id: 3, correct: true},
                {body: 'No', question_id: 3, correct: false}
              ])
css_question.answers.create([
                {body: 'Yes', question_id: 4, correct: true},
                {body: 'No', question_id: 4, correct: false}
              ])
js_question.answers.create([
                {body: 'Yes', question_id: 5, correct: true},
                {body: 'No', question_id: 5, correct: false}
              ])
swift_question.answers.create([
                {body: 'Yes', question_id: 6, correct: true},
                {body: 'No', question_id: 6, correct: false}
              ])
