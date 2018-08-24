class Question < ApplicationRecord
 has_many :answers, dependent: :destroy
 accepts_nested_attributes_for :answers, limit: 4, :reject_if => proc {
  |attributes| attributes['answertext'].blank?
 } 
end
