class QuizzesController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def random
    @question ||= Question.order("RANDOM()").first

    render :show
  end
end
