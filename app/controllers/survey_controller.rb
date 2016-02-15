get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/all_surveys'
end

get '/users/:user_id/surveys/new' do
  erb :'surveys/new_survey'
end

post '/users/:user_id/surveys' do
  @survey = Survey.new(title: params[:title], description: params[:description])
  @user = User.find(session[:user_id])
  @survey.maker = @user
  @survey.save
  redirect "/users/#{session[:user_id]}/surveys/#{@survey.id}/questions/new"
end

get '/users/:user_id/surveys/:survey_id/questions/new' do
  @survey = Survey.find(params[:survey_id])
  erb :'surveys/new_question'
end

get '/users/:user_id/surveys/:survey_id/questions/:question_id/edit' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  erb :'surveys/edit_question'
end

put '/users/:user_id/surveys/:survey_id/questions/:question_id' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  @question.update_attributes(question: params[:question])
  @question.answers.delete_all
  @answer1 = Answer.new(answer: params[:answer1])
  @answer1.question = @question
  @answer2 = Answer.new(answer: params[:answer2])
  @answer2.question = @question
  @answer3 = Answer.new(answer: params[:answer3])
  @answer3.question = @question
  @answer4 = Answer.new(answer: params[:answer4])
  @answer4.question = @question
  @survey.save
  @question.save
  @answer1.save
  @answer2.save
  @answer3.save
  @answer4.save

  redirect "/users/#{@survey.maker.id}/survey/#{@survey.id}"
end

post '/users/:user_id/surveys/:survey_id/questions' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.new(question: params[:question])
  @question.survey = @survey
  @answer1 = Answer.new(answer: params[:answer1])
  @answer1.question = @question
  @answer2 = Answer.new(answer: params[:answer2])
  @answer2.question = @question
  @answer3 = Answer.new(answer: params[:answer3])
  @answer3.question = @question
  @answer4 = Answer.new(answer: params[:answer4])
  @answer4.question = @question
  @survey.save
  @question.save
  @answer1.save
  @answer2.save
  @answer3.save
  @answer4.save
  redirect "/users/#{session[:user_id]}/survey/#{@survey.id}"
end

get '/users/:user_id/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = Question.where("survey_id = ?", params[:id])
  erb :'surveys/show_survey'
end

get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  # @questions = Response.where()
  erb :'surveys/result_survey'
end

get '/surveys/:id/take' do
  @survey = Survey.find(params[:id])

  erb :'surveys/take_survey'
end


