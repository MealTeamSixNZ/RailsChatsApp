class AddDriverReferencesToArea < ActiveRecord::Migration[7.1]
  def change
    add_reference :drivers, :area, foreign_key: {to_table: :areas}
  end
end
