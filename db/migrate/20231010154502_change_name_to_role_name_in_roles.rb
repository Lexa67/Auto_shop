class ChangeNameToRoleNameInRoles < ActiveRecord::Migration[7.0]
  def change
    rename_column :roles, :name, :role_name
  end
end
