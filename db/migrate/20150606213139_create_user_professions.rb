class CreateUserProfessions < ActiveRecord::Migration
  def change
    create_table :user_professions do |t|
      t.integer :user_id, index: true
      t.integer :profession_id, index: true

      t.timestamps null: false
    end
  end
end
