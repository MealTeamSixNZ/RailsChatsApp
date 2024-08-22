class Areas < ActiveRecord::Migration[7.1]
  def change
    create_table :areas do |t|
      t.string :name
    end
  end
end
