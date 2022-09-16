class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.references :question, foreign_key: true
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
