class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
