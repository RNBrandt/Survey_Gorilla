def logged_in?
  session[:user_id] != nil ? true : false
end
