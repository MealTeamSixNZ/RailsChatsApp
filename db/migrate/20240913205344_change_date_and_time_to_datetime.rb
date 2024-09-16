class ChangeDateAndTimeToDatetime < ActiveRecord::Migration[7.1]
  def change
    remove_column :notices, :start_date
    remove_column :notices, :start_time
    remove_column :notices, :end_date
    remove_column :notices, :end_time
    add_column :notices, :start_datetime, :datetime, null: false, default: DateTime.current
    add_column :notices, :end_datetime, :datetime
  end
end
