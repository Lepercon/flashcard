class CreateCorrectlyAnsweredQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :correctly_answered_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.timestamps
    end
  end
end
