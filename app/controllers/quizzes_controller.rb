class QuizzesController < ApplicationController
  def show
    if params[:format].present?
      @question = Question.find(params[:format])
    else
      @question ||= Question.order("RANDOM()").first
    end
  end
end
