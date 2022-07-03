class AddUsersLoginPasswordTestidNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :test_id, false)
  end
end
