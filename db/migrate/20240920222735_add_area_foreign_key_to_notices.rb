class AddAreaForeignKeyToNotices < ActiveRecord::Migration[7.1]
  def change
    add_reference :notices, :area, foreign_key: true, default: 1, null: false
  end
end
