class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :reference_number
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
