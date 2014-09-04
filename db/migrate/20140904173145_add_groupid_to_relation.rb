class AddGroupidToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :group_id, :integer
  end
end
