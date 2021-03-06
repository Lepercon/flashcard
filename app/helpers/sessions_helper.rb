module SessionsHelper
  
  #Logs in given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Remebers a user in a persisten session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #Returns current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #Returns true if logged in, false else
  def logged_in?
    !current_user.nil?
  end

  #Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #Logs out current user
  def log_out
    current_user.update(correct_answers_given: 0, incorrect_answers_given: 0)
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
