class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string 'lastname', null: false, default: ""
      t.string 'firstname', null: false, default: ""
      t.string 'patronymic', null: false, default: ""
      t.integer 'group_id', null: false

      t.timestamps
    end
  end
end
