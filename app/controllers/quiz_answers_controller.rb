class QuizAnswersController < ApplicationController
  def create
    if answer_correct?
      render template: 'static_pages/correct'
    else
      @question = @answer.question
      render template: 'static_pages/incorrect'
    end
  end

  private

  def given_answer_params
    return {} if params[:given_answer].blank?
    params.require(:given_answer).permit!
  end

  def answer_correct?
    return false unless find_answer
    @answer.correct?
  end

  def find_answer
    @answer = Answer.find(given_answer_params[:answer_id])
  end

end
