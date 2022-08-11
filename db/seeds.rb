admin = Admin.create!(
        email: 'admin@testguru.com',
        password: '1234567',
        password_confirmation: '1234567',
        type: "Admin",
        first_name: "FirstName",
        last_name: "LastName",
        confirmed_at: Time.zone.now
       )

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = backend.tests.create!(title: 'Ruby', level: 3, author_id: admin.id)
go_test = backend.tests.create(title: 'Go', level: 2, author_id: admin.id)
html_test = fronted.tests.create(title: 'HTML', level: 1, author_id: admin.id)
css_test = fronted.tests.create(title: 'CSS', level: 1, author_id: admin.id)
js_test = mobile.tests.create(title: 'JS', level: 2, author_id: admin.id)
swift_test = mobile.tests.create(title: 'Swift', level: 3, author_id: admin.id)

ruby_question = ruby_test.questions.create(title: 'Ruby its Backend language?')
go_question = go_test.questions.create(title: 'Go its Backend language?')
html_question = html_test.questions.create(title: 'HTML its Fronted language?')
css_question = css_test.questions.create(title: 'CSS its Fronted language?')
js_question = js_test.questions.create(title: 'JS its Mobile language?')
swift_question = swift_test.questions.create(title: 'Swift its Mobile language?')

ruby_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
go_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
html_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
css_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
js_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
swift_question.answers.create([
                {body: 'Yes', correct: true},
                {body: 'No', correct: false}
              ])
