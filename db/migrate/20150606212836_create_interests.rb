class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_interest_id
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
