class AddAdministrationsIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :administrations_id, :integer
  end
end
