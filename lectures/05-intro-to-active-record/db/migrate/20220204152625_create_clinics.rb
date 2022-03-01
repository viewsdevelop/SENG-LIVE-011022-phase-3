class CreateClinics < ActiveRecord::Migration[6.1]
  # Activity 1 => Building DB Migrations

  # Write necessary code to create 'clinics' table with following
  # columns: clinic_name (string), address (string), phone (string)
  
  # Run "rake db:migrate" and verify via "schema.rb" / sqlite3

  # BONUS => Generate additional "created_at" and "updated_at" columns using
  # one line of code

  def change
    create_table :clinics do |t|
      t.string :clinic_name
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
