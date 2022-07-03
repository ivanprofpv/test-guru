class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.integer :test_id
      t.integer :question_id
      t.string :correct

      t.timestamps
    end
  end
end
