class AddIncorrectAnswersGivenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :incorrect_answers_given, :integer
  end
end
