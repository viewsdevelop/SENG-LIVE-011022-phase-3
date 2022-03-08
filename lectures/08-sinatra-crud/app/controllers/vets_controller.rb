class VetsController < ApplicationController
    
    # Activity 2 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create a Vet with the following 
    # attributes:
    #   - vet_name: 'Tiger King'
    #   - specialty: 'cats'

    post '/vets' do
        vet = Vet.create(
            vet_name: params[:vet_name],
            specialty: params[:specialty]
        )

        vet.to_json
    end
    
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
    patch '/vets/:id' do
        # binding.pry
        
        # find the vet using the ID
        vet = Vet.find(params[:id])
        
        # select attributes to update
        attrs_to_update = params.select do |key, value| 
            [ "vet_name", "specialty"].include?(key)
        end
        
        # update the vet
        vet.update(attrs_to_update)

        # send a response with the updated vet as JSON
        # ❗ why send updated instance as a response?
        vet.to_json
    end

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Vet. Confirm that it's
    # been deleted by navigating to 'localhost:9292/vets/11'. What happens?

    delete '/vets/:id' do
        vet = Vet.find(params[:id])
        vet.destroy
        vet.to_json
    end
end 