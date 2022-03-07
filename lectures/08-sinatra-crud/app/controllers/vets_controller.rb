class VetsController < ApplicationController
    
    # Activity 2 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create a Vet with the following 
    # attributes:
    #   - vet_name: 'Tiger King'
    #   - specialty: 'cats'

    # READ (GET) (ALL)
    get '/vets' do
        vets = Vet.all
        vets.to_json(
            only: [:vet_name, :specialty], 
            include: :patients
        )
    end

    # READ (GET) (ONE)
    get '/vets/:id' do
        vet = Vet.all.find(params[:id])
        vet.to_json(include: :appointments)
    end
    
    # UPDATE (PATCH) (ONE)
    # NOTE => To check, use Postman to update our created Vet with the following 
    # attribute:
    #   - vet_name: "Carole Baskin"

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Vet. Confirm that it's
    # been deleted by navigating to 'localhost:9292/vets/11'. What happens?
end 