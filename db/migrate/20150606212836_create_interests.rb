class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
