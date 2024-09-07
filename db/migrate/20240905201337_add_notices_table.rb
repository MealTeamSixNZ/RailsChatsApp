class AddNoticesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :title, null: false
      t.text :content
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.timestamps
    end
    add_reference :notices, :created_by, foreign_key: {to_table: :staff}
  end
end
