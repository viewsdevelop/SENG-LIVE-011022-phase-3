class Clinic < ActiveRecord::Base
    # dependent: :destroy will delete every child instance associated with clinic, if clinic is deleted
    
    # If Clinic A has two Patients and we delete Clinic A, those two Patients
    # will have FAULTY DATA
    
    has_many :patients, dependent: :destroy

    # def self.first
    # end

    # def self.all
    # end
end 

