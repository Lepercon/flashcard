class Answer < ApplicationRecord
	belongs_to :question
  validates :answertext, length: { minimum: 2 }
end
