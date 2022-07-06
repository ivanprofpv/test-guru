10.times do |i|
  User.create(
    login: "User-#{i}",
    password: "1234_#{i}"
  )
end

backend = Category.create(title: 'Backend')
fronted = Category.create(title: 'Fronted')
mobile = Category.create(title: 'mobile')

ruby_test = Test.create(title: 'Ruby', level: 3)
go_test = Test.create(title: 'Go', level: 2)
html_test = Test.create(title: 'HTML', level: 1)
css_test = Test.create(title: 'CSS', level: 1)
js_test = Test.create(title: 'JS', level: 2)
swift_test = Test.create(title: 'Swift', level: 3)

ruby_question = Question.create(title: 'Ruby its Backend language?')
go_question = Question.create(title: 'Go its Backend language?')
html_question = Question.create(title: 'HTML its Fronted language?')
css_question = Question.create(title: 'CSS its Fronted language?')
js_question = Question.create(title: 'JS its Mobile language?')
swift_question = Question.create(title: 'Swift its Mobile language?')

Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
Answer.create([
                {title: 'Yes', correct: true},
                {title: 'No', correct: false}
              ])
