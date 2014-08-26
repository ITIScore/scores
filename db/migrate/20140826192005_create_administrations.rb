class CreateAdministrations < ActiveRecord::Migration
  def change
    create_table :administrations do |t|
      t.string 'firstname', null: false, default: ""
      t.string 'lastname', null: false, default: ""
      t.string 'email', null: false, default: ""

      t.timestamps
    end
  end
end
