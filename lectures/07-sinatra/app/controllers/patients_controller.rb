class PatientsController < ApplicationController
    
    # Activity 1 => Implementing Routes in Sinatra

    # NOTE => Run `bundle exec rake server` to view JSON responses in the Browser
    
    # /patients => Retrieve All Patients and Associated Clinics
    # BONUS => Include Only Patient's Name & Age Attributes
    # BONUS => Set Limit of First 10 Patients Ordered By Name

    # React
    # /patients => Handle UI Rendering, Pass On Request
    # initiate fetch request targeting an API endpoint

    # our API endpoint
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

    # /patients/:id => Retrieve Individual Patient via Params (:id)
    # BONUS => Include Patient's Associated Appointments

    get '/patients/:id' do    
        patient = Patient.find(params[:id])
        patient.to_json(include: :appointments)
    end
end 