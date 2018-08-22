class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      if params[:session][:remember_me] == '1'
        flash[:warning] = "You have ticked the 'Remember me' option. This
                            means that you will not be logged out upon
                             closing your browser window" 
        remember(@user) 
      else
        forget(@user)
      end
      redirect_to @user
    else
      flash.now[:danger] = "Invalid email/ password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
