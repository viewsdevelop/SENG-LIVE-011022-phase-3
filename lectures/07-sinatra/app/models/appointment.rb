class Appointment < ActiveRecord::Base
    belongs_to :patient
    belongs_to :vet

    # Return earliest appointment
    def self.earliest
        # self.all.minimum(:date)
        self.all.pluck(:date).min
    end

    # Return latest appointment
    def self.latest
        self.all.pluck(:date).max
    end
end 