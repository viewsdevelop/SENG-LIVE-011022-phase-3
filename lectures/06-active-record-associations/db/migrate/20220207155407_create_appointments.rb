class CreateAppointments < ActiveRecord::Migration[6.1]
  # Activity 1 => Building DB Migrations

  # Write necessary code to create 'appointments' JOIN table with following
  # columns: date (date), vet_id (integer), patient_id (integer)
  
  # Run "rake db:migrate" and verify via "schema.rb" / sqlite3

  # BONUS => Try using "t.references" to set up foreign keys for vet 
  # (vet_id) and patient (patient_id).

  # https://api.rubyonrails.org/v5.1/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-references
  
  def change
  end
end
