enable :sessions

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id
  redirect "/users/#{session[:user_id]}/yours"
end

get '/users/:user_id/yours' do

  erb :'users/yours'
end

