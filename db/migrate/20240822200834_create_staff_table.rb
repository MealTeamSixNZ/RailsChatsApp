class CreateStaffTable < ActiveRecord::Migration[7.1]
  def change
    create_table :staff_tables do |t|
      t.string :name, null: false
      t.string :role, null: false
      t.string :email, default: "", null: false

      t.timestamps
    end
  end
end
