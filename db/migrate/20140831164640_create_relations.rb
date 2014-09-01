class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer 'student_id', null: false
      t.integer 'event_id', null: false
      t.integer 'score', null: false

      t.timestamps
    end
  end
end
