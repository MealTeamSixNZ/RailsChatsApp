class RenameUsersTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :users, :drivers
  end
end
