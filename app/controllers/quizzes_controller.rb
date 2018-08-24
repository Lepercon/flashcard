class QuizzesController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def random
    @question ||= Question.order("RANDOM()").first
    if !@question.answers.blank?
      render :show
    else
      flash[:warning] = "You skipped a question with no answers"
      redirect_to random_quizzes_path
    end
  end
end
