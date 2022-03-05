class AppointmentsController < ApplicationController
    
    get '/appointments/earliest' do
        Appointment.earliest.to_json
    end

    get '/appointments/latest' do
        Appointment.latest.to_json
    end

    # Activity 1 => Implementing Routes in Sinatra

    # NOTE => Run `bundle exec rake server` to view JSON responses in the Browser

    # /appointments => Retrieve All Appointments
    # BONUS => Include Only Appointment Date + Associated Vet / Patient Names
    # BONUS => Set Limit of First 50 Appointments Ordered By Date
    get '/appointments' do
        appointments = Appointment.all.order(:date).limit(50)
        
        # patients.to_json(only: [:name, :age], include: :clinic)
        appointments.to_json(
            only: [:date], 
            include: { vet: { only: [:vet_name] }, 
            patient: { only: [:name] } 
        })
    end 

    # /appointments/:id => Retrieve an Individual Appointment via Params (:id)
    get '/appointments/:id' do
        Appointment.find(params[:id]).to_json
    end 
end 