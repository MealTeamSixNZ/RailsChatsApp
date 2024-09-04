class AddStaffType < ActiveRecord::Migration[7.1]
  def change
    add_column :staff, :staff_type, :string, null: false, default: "D"
  end
end
