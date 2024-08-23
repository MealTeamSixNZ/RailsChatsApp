class DropUsersAndStaff < ActiveRecord::Migration[7.1]
  def change
    drop_table :drivers
    drop_table :staff
  end
end
