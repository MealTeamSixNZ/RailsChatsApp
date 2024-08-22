class SetMessageColumnsNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :messages, :content, false
    change_column_null :messages, :driver_id, false
    change_column_null :messages, :type, false
  end
end
