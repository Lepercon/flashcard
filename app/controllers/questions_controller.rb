class QuestionsController < ApplicationController
  def index
      @question = Question.order("RANDOM()").first
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    
  end

  def destroy
  end
  
  private

  def question_params
    params.permit(:id, :text)
  end
end
