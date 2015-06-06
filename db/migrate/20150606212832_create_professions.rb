class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
