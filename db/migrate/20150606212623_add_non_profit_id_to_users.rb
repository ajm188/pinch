class AddNonProfitIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :non_profit
    end
  end
end
