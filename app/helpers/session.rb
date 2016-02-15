helpers do

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authorized
    p logged_in?
    unless logged_in?
      redirect '/'
    end
  end

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def logout!
    session[:id] = nil
    redirect '/'
  end

end

