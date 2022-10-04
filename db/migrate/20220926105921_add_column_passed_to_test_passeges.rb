class AddColumnPassedToTestPasseges < ActiveRecord::Migration[6.1]
  def up
    add_column :test_passages, :passed, :boolean, default: false
  end

  def down
    remove_column :test_passages, :passed
  end
end
