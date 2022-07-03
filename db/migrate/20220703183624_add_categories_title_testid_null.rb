class AddCategoriesTitleTestidNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :test_id, false)
  end
end
