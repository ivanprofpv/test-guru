class DropTableTestsPasseds < ActiveRecord::Migration[6.1]
  
  def up
    drop_table :tests_passeds, if_exists: true
  end

  def down
  end

end
