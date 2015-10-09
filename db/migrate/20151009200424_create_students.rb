class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.date :dob
      t.integer :ssn
      t.string :gender
      t.integer :grade
      t.string :ethnicity
      t.text :home_address
      t.string :mobile_phone
      t.string :email_address

      t.timestamps null: false
    end
  end
end
