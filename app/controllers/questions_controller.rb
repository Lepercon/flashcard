class QuestionsController < ApplicationController
  def index 
      @question = Question.order("RANDOM()").first
  end

  def show
    matches = request.original_url.scan(/\d*$/).first.to_i
    @question = Question.find(matches)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    if answer_correct?
      render template: 'static_pages/correct'
    else
      render template: 'static_pages/incorrect'
    end
  end

  def destroy
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
  

