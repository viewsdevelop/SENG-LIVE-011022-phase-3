class PatientsController < ApplicationController

    # CREATE (POST) (ONE)
    post '/patients' do
        # binding.pry
        
        # create Patient instance using passed param values
        patient = Patient.create(
            species: params[:species],
            name: params[:name],
            age: params[:age],
            owner: params[:owner],
            phone: params[:phone],
            active: params[:active],
            clinic_id: params[:clinic_id]
        )

        # send a response with the created patient as JSON
        # ❗ why send created instance as a response?
        patient.to_json
    end

    # READ (GET) (ALL)
    get '/patients' do
        
        # demand is sent to Patient Model
        # apply Ruby logic to organize data as necessary
        patients = Patient.all.order(:name).limit(10)
        
        # apply Ruby logic to filter organized data
        patients.to_json(
            only: [:name, :age], 
            include: :clinic
        )
    end

    # READ (GET) (ONE)
    get '/patients/:id' do  
        # find the patient using the ID  
        patient = Patient.find(params[:id])
        # send a response with the found patient + associated appointments as JSON
        patient.to_json(include: :appointments)
    end

    # UPDATE (PATCH) (ONE)
    patch '/patients/:id' do
        # binding.pry
        
        # find the patient using the ID
        patient = Patient.find(params[:id])
        
        # select attributes to update
        attrs_to_update = params.select do |key, value| 
            [ "species", "name", "age", "owner", "phone", "active", "clinic_id"].include?(key)
        end
        
        # update the patient
        patient.update(attrs_to_update)

        # send a response with the updated patient as JSON
        # ❗ why send updated instance as a response?
        patient.to_json
    end

    # DESTROY (DELETE) (ONE)
    delete '/patients/:id' do
        # find the patient using the ID
        patient = Patient.find(params[:id])

        # delete the patient
        patient.destroy
        
        # send a response with the deleted patient as JSON
        # ❗ why send deleted instance as a response?
        patient.to_json
    end
end