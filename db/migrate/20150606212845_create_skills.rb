class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
