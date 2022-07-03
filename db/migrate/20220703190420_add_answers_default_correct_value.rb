class AddAnswersDefaultCorrectValue < ActiveRecord::Migration[6.0]
  def change
        change_column_default(:answers, :correct, 'new')
  end
end
