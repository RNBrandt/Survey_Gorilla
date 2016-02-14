require 'faker'

5.times do |n|
  User.create(
  username: Faker::App.name,
  email: Faker::Internet.email,
  password: 'password')
end

20.times do |n|
  Survey.create(
  title: Faker::Book.publisher,
  description: Faker::Hipster.sentence,
  maker: (User.all).sample)
end


75.times do |n|
  Question.create(
  question: "#{Faker::Hipster.sentence}?",
  survey: (Survey.all).sample)
end

225.times do |n|
  Answer.create(
  question: (Question.all).sample,
  answer: Faker::Book.title )
end

75.times do |n|
  answer_var = (Answer.all).sample
  Response.create(
  answer: answer_var,
  question: Question.find(answer_var.question_id),
  taker: (User.all).sample)
end

# @responses = Response.all

# @responses.each do |response|
#   response.question = response.answer.question_id
# end


# Survey.create(title: 'Survey')
# Question.create(question: 'sup?')
# Answer.create(answer: 'ok')
# Answer.create(answer: 'gr8')
