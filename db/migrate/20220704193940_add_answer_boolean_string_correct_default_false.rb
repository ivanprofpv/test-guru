class AddAnswerBooleanStringCorrectDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column(:answers, :correct, :boolean)
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
