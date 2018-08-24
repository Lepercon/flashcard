class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end 

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Your question has been added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update

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

  def question_params
    params.require(:question).permit(:text, answers_attributes: [:id, 
                                      :answertext])
  end
end
