class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :subsection
      t.integer :capacity
      t.timestamps null: false
    end
  end
end
