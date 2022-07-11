class ChangeTableLoginToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
    t.rename :login, :email
    end
  end
end
