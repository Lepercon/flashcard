class QuizzesController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def random
    @user = current_user
    correctly_answered_questions_ids = @user.correctly_answered_questions.pluck(&:question_id)
    @question ||= Question.where.not(id: correctly_answered_questions_ids).order("RANDOM()").first
    if !@question.answers.blank?
      render :show
    else
      flash[:warning] = "You skipped question #{@question.id}, which has 
                          no answers"
      redirect_to random_quizzes_path
    end
  end
end
