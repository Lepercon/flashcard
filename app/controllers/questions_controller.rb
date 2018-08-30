class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    4.times do
      @question.answers.build
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Your question has been added!"
      redirect_to questions_path
    else
      @n = 0
      @question.answers.each do |ans|
        if !ans.blank?
          @n +=1
        end
      end
      if @n != 4
        (4-@n).times do
          @question.answers.build
        end
      end
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully
                                                  updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path}
      flash[:success] = "Question deleted"
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

  def question_params
    params.require(:question).permit(:text, answers_attributes: [:id,
                                      :answertext, :correct])
  end
end
