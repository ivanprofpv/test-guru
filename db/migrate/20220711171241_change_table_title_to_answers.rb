class ChangeTableTitleToAnswers < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
    t.rename :title, :body
    end
  end
end
