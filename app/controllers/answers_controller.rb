class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Your answer has been added"
      redirect_to new_answer_path
    else
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answertext, :question_id)
  end

end