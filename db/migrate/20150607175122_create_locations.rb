class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address, null: false

      t.timestamps null: false
    end
    add_column :events, :location_id, :integer
  end
end
