class CreatePatients < ActiveRecord::Migration[6.1]
  # Activity 1 => Building DB Migrations

  # Write necessary code to create 'patients' table with following
  # columns: species (string), name (string), age (integer),
  # owner (string), phone (string), active (boolean), clinic_id (integer)
  
  # Run "rake db:migrate" and verify via "schema.rb" / sqlite3
  
  # BONUS => Generate additional "created_at" and "updated_at" columns using
  # one line of code

  def change
    create_table :patients do |t|
      t.string :species
      t.string :name
      t.integer :age
      t.string :owner
      t.string :phone
      t.boolean :active
      t.integer :clinic_id
      t.timestamps
    end
  end
end
