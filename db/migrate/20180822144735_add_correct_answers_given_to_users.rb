class AddCorrectAnswersGivenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :correct_answers_given, :integer
  end
end
