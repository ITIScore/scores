class AddToAdministrationsOwnerId < ActiveRecord::Migration
  def change
    add_column :administrations, :owner_id, :integer
  end
end
