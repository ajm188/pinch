class CreateUsersEvents < ActiveRecord::Migration
  def change
    create_table :users_events, id: false do |t|
      t.references :user
      t.references :event
    end
  end
end
