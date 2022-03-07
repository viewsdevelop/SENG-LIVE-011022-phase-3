class ClinicsController < ApplicationController

    # Activity 1 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create a Clinic with the following 
    # attributes:
    #   - clinic_name: "Flatiron Vet Clinic"
    #   - address: "111 Hacker Way"
    #   - phone: 012-345-6789
    
    # READ (GET) (ALL)
    get '/clinics' do
        clinics = Clinic.all
        
        clinics.to_json(
            only: [:clinic_name], 
            include: { patients: 
                { only: [:name, :species] }
            })
    end
    
    # READ (GET) (ONE)
    get '/clinics/:id' do
        clinic = Clinic.find(params[:id])
        clinic.to_json(include: :patients)
    end

    # UPDATE (PATCH) (ONE)
    # NOTE => To check, use Postman to update our created Clinic with the following 
    # attribute:
    #   - address: "222 Hacker Way"

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Clinic. Confirm that it's
    # been deleted by navigating to 'localhost:9292/clinics/3'. What happens?
end