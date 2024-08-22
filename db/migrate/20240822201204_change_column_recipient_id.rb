class ChangeColumnRecipientId < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :recipient_id, :staff_id
  end
end
