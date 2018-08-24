class Question < ApplicationRecord
  validates :text, length: { minimum: 3 }
  has_many :answers, dependent: :destroy
  validate :question_has_four_answers
  accepts_nested_attributes_for :answers, limit: 4, :reject_if => proc {
  |attributes| attributes['answertext'].blank?
  }  

  def question_has_four_answers
    return if answers.blank?
    errors.add(:base, "Every question must have 4 answers") if answers.size != 4
  end
end
