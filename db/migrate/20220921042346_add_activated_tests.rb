class AddActivatedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :activated, :boolean, default: false
  end
end
