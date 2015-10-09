class CreateEducators < ActiveRecord::Migration
  def change
    create_table :educators do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.text :summary
      t.date :dob
      t.integer :ssn
      t.string :gender
      t.string :ethnicity

      t.timestamps null: false
    end
  end
end
