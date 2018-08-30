class CorrectlyAnsweredQuestionsController < ApplicationController
  def new
    
  end

  def create
    @correctly_answered_question = CorrectlyAnsweredQuestion.new(correctly_answered_question_params)
    
  end

  def destroy
    @user = current_user
    @user.correctly_answered_questions.destroy_all
    flash[:success] = "Your questions have been reset"
    redirect_to random_quizzes_path
  end

  private 

  def correctly_answered_question_params
    params.require(correctly_answered_question).permit(:question_id, :user_id)
  end  
end
