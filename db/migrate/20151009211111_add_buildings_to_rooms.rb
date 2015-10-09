class AddBuildingsToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :building, index: true
    add_foreign_key :rooms, :buildings
  end
end
