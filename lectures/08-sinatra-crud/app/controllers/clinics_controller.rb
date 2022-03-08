class ClinicsController < ApplicationController

    # Activity 1 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create a Clinic with the following 
    # attributes:
    #   - clinic_name: "Flatiron Vet Clinic"
    #   - address: "111 Hacker Way"
    #   - phone: 012-345-6789
    post '/clinics' do
        clinic = Clinic.create(
            clinic_name: params[:clinic_name],
            address: params[:address],
            phone: params[:phone]
        )

        clinic.to_json

        # /clinics/3 => Show page for newly created Clinic
    end
    
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
    patch '/clinics/:id' do
        # binding.pry
        
        # find the clinic using the ID
        clinic = Clinic.find(params[:id])
        
        # select attributes to update
        attrs_to_update = params.select do |key, value| 
            [ "clinic_name", "address", "phone"].include?(key)
        end
        
        # update the clinic
        clinic.update(attrs_to_update)

        # send a response with the updated clinic as JSON
        # ❗ why send updated instance as a response?
        clinic.to_json
    end

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Clinic. Confirm that it's
    # been deleted by navigating to 'localhost:9292/clinics/3'. What happens?
    delete '/clinics/:id' do
        clinic = Clinic.find(params[:id])
        clinic.destroy
        clinic.to_json
        # /clinics/3 => CANNOT redirect to show page for newly updated Clinic
        # /clinics => View of all existing Clinic resources (2 remaining) 
    end
end