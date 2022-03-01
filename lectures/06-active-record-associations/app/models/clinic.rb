class Clinic < ActiveRecord::Base
    # dependent: :destroy will delete every child instance associated with clinic, if clinic is deleted
    has_many :patients, dependent: :destroy
end 

