class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      if params[:session][:remember_me] == '1'
        flash[:success] = "You have ticked the 'Remember me' option. Next
                          time you visit you won't have to login and your
                          answers count will be remembered." 
        remember(@user) 
      else
        flash[:warning] = "You have not ticked the 'Remember me' option. 
                           next time you visit your answers count will be 
                           reset and you will have to login again."
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
