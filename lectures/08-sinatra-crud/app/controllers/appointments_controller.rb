class AppointmentsController < ApplicationController
    
    # Activity 2 => Handling CREATE, UPDATE, and DELETE Requests in Sinatra

    # CREATE (POST) (ONE)
    # NOTE => To check, use Postman to create an Appointment with the following 
    # attributes:
    #   - patient_id: <first Patient id>
    #   - vet_id: <first Vet id>
    #   - date: <current date/time>


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

    # DESTROY (DELETE) (ONE)
    # NOTE => To check, use Postman to delete our created Appointment. Confirm that it's
    # been deleted by navigating to 'localhost:9292/appointments/151'. What happens?
end 