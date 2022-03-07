class Clinic < ActiveRecord::Base
    has_many :patients, dependent: :destroy
    
    # Return all clinic names
    # def self.all_clinic_names
    #     self.all.pluck(:clinic_name)
    # end

    # def welcome 
    #     puts "Welcome to #{self.clinic_name}"
    # end 
end 