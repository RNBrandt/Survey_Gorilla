get '/users/:user_id/surveys/new' do

  erb :'surveys/new_survey'

end

post '/users/:user_id/surveys' do

  @survey = Survey.new(title: params[:title], description: params[:description])
  @user = User.find(session[:user_id])
  @survey.maker = @user.

  redirect "/users/#{session[:user_id]}/surveys/#{@survey.id}/questions/new"
end

get '/users/:user_id/surveys/:survey_id/questions/new' do

  erb :'surveys/new_question'
end


