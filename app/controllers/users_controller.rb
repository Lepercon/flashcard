class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(correct_answers_given: 0, incorrect_answers_given: 0)
      log_in @user
      flash[:success] = "Welcome to the Cyber Dictionary!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully 
                                                    updated.' }
        else
          format.html { render :edit }
        end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end

end
