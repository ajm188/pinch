class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.integer :user_id, index: true
      t.integer :interest_id, index: true

      t.timestamps null: false
    end
  end
end
