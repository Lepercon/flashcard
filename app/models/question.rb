class Question < ApplicationRecord
  validates :text, length: { minimum: 3 }
  has_many :answers, dependent: :destroy
  validate :question_has_four_answers
  validate :question_has_only_one_correct_answer
  accepts_nested_attributes_for :answers, limit: 4, :reject_if => proc {
  |attributes| attributes['answertext'].blank?
  }  

  def question_has_four_answers
    return if answers.blank?
    if answers.size != 4
      errors.add(:base, "Every question must have 4 answers")
    end 
  end

  def question_has_only_one_correct_answer
    return if answers.blank?
    if answers.select{|a| a.correct == true}.count > 1
      errors.add(:base, "You can only have one correct answer")
    end
  end

  # def question_has_one_correct_answer
  #   return if answers.blank?
  #   new_question_correct_answer_count = 0
  #   if answer.correct?
  #     new_question_correct_answer_count +=1
  #   end

  #   if new_question_correct_answer_count !=1
  #     errors.add(:base, "The question must have 1 correct answer")
  #   end

  #end
end