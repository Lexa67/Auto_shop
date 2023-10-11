class ChangeUserNameToUserUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :user_name
  end
end
