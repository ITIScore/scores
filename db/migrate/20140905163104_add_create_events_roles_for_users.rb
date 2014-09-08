class AddCreateEventsRolesForUsers < ActiveRecord::Migration
  def change
    add_column :users, :create_events, :string
  end
end
