class CreateTestsPasseds < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_passeds do |t|
      t.integer :id_tests, null: false
      t.integer :id_users, null: false
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
