enable :sessions
require_relative '../helpers/login'

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{session[:user_id]}/yours"
  else
    flash[:error_login] = "Try again!"
    redirect '/login'
  end
end



post '/users' do
  @user= User.new(username: params[:username], email: params[:email])
  @user.password = params[:password]
  @user.save
  if @user_id != nil
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/yours"
  else
    flash[:error_signup] = "Try again!"
  end
end

get '/users/:user_id/yours' do
  erb :'users/yours'
end

get '/logout' do
  session.clear
end

