class CreateTestsPasseds < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_passeds do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
