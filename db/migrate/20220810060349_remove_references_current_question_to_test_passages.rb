class RemoveReferencesCurrentQuestionToTestPassages < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:test_passages, :current_question, foreign_key: true)
  end
end
