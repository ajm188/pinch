class CreateNonProfits < ActiveRecord::Migration
  def change
    create_table :non_profits do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
