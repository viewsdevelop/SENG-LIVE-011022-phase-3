class ClinicsController < ApplicationController
    
    # Activity 2 => Implementing Routes in Sinatra

    # NOTE => Run `bundle exec rake server` to view JSON responses in the Browser
    
    # /clinics => Retrieve All Clinics and Associated Patients
    # BONUS => Include Only Clinic's Name Attribute and Patient's Name / Species Attributes

    get '/clinics' do
        clinics = Clinic.all
        
        clinics.to_json(
            only: [:clinic_name], 
            include: { 
                patients: { 
                    only: [:name, :species] 
                }
            }
        )
    end

    # /clinics/:id => Retrieve an Individual Clinic via Params (:id)
    # BONUS => Include Clinic's Associated Patients

    get '/clinics/:id' do
        clinic = Clinic.find(params[:id])
        clinic.to_json(include: :patients)
    end
end 