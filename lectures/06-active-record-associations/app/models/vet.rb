# Activity 2: Adding Active Record Association Methods

class Vet < ActiveRecord::Base
    # Add necessary "has_many" Active Record macros to associate
    # one Vet with many Appointments and many Patients through Appointments.

    # NOTE => Remember that the order of Active Record macros matters!

    # Class Methods

    # Return all Vets' names
    # Hint => .pluck() (https://apidock.com/rails/ActiveRecord/Calculations/pluck)
    def self.all_vet_names
    end

    # Return Vet with the most Patients
    # Hint => .max() + .length() (https://apidock.com/ruby/Enumerable/max)
    def self.most_patients 
    end 

    # Instance Methods

    # Return a collection of a Vet's Patients whose ages are greater than 9
    # Hint => .where() (https://apidock.com/rails/ActiveRecord/QueryMethods/where)
    def find_old_patients
    end

    # Return a collection of a Vet's Patients' names and numbers
    # Hint => .pluck() (https://apidock.com/rails/ActiveRecord/Calculations/pluck)
    def list_names_and_numbers
    end
    
    # Return a Vet's oldest Patient's age
    # Hint => .maximum() (https://apidock.com/rails/ActiveRecord/Calculations/ClassMethods/maximum)
    def find_oldest_patient
    end 
end 