# Activity 2: Adding Active Record Association Methods

class Patient < ActiveRecord::Base
    belongs_to :clinic

    # Add necessary "has_many" Active Record macros to associate
    # one Patient with many Appointments and many Vets through Appointments.
    
    has_many :appointments
    has_many :vets, through: :appointments

    # NOTE => Remember that the order of Active Record macros matters!
end 
