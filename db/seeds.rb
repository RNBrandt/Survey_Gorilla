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
  Response.create(
  question: (Question.all).sample,
  taker: (User.all).sample,
  answer: (Answre.all).sample )
end

# Survey.create(title: 'Survey')
# Question.create(question: 'sup?')
# Answer.create(answer: 'ok')
# Answer.create(answer: 'gr8')
