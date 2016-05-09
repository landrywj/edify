class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.references :semester, index: true
      t.references :course, index: true
      t.integer :credits
      t.string :format
      t.integer :building_id
      t.integer :room_id

      t.timestamps null: false
    end
    add_foreign_key :offerings, :semesters
    add_foreign_key :offerings, :courses
  end
end
