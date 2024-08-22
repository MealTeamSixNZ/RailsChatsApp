class RenameStaffTableAndAddForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :staff_id
    rename_table :staff_tables, :staff
    add_reference :messages, :staff, foreign_key: {to_table: :staff}
  end
end
