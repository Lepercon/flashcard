class Answer < ApplicationRecord
	belongs_to :question
  validates :answertext, length: { minimum: 2 }
  validate :question_has_four_answers, :on => :create

  def question_has_four_answers
    if self.question.answers(:reload).count > 3
      errors.add(:base, "| too many answers given")
    elsif self.question.answers(:reload).count < 3
      errors.add(:base, "| too few answers given")
    end
  end
end
