class AppointmentsController < ApplicationController
    
    # Activity 2 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create an Appointment with the following 
    # attributes:
    #   - patient_id: <first Patient id> (params[:patient_id])
    #   - vet_id: <first Vet id>
    #   - date: <current date/time>
    post '/appointments' do
        appointment = Appointment.create(
            patient_id: Patient.first.id,
            vet_id: Vet.first.id,
            date: Time.now
        )

        appointment.to_json
    end

    # READ (GET) (ALL)
    get '/appointments' do
        appointments = Appointment.all.order(:date).limit(50)
        
        # patients.to_json(only: [:name, :age], include: :clinic)
        appointments.to_json(
            only: [:date], 
            include: { vet: { only: [:vet_name] }, 
            patient: { only: [:name] } 
        })
    end 

    # READ (GET) (ONE)
    get '/appointments/:id' do
        Appointment.find(params[:id]).to_json
    end 

    # UPDATE (PATCH) (ONE)
    # NOTE => To check, use Postman to update our created Appointment with the following 
    # attribute:
    #   - vet_id: <last Vet id>
    #   - patient_id: <last Patient id>
    patch '/appointments/:id' do
        # binding.pry
        
        # find the appointment using the ID
        appointment = Appointment.find(params[:id])
        
        # select attributes to update
        attrs_to_update = params.select do |key, value| 
            [ "patient_id", "vet_id", "date"].include?(key)
        end
        
        # update the appointment
        appointment.update(attrs_to_update)

        # send a response with the updated appointment as JSON
        # ❗ why send updated instance as a response?
        appointment.to_json
    end

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Appointment. Confirm that it's
    # been deleted by navigating to 'localhost:9292/appointments/151'. What happens?
    delete '/appointments/:id' do
        appointment = Appointment.find(params[:id])
        appointment.destroy
        appointment.to_json
    end
end 