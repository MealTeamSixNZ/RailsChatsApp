class ChangeColumnSenderId < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :sender_id, :driver_id
  end
end
