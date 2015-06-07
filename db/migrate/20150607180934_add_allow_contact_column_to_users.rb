class AddAllowContactColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allow_contact, :boolean
  end
end
