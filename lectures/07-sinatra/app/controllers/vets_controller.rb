class VetsController < ApplicationController
    
    # Activity 2 => Implementing Routes in Sinatra

    # NOTE => Run `bundle exec rake server` to view JSON responses in the Browser

    # /vets => Retrieve All Vets and Associated Patients
    # BONUS => Include Only Vet's Name & Specialty Attributes

    get '/vets' do
        vets = Vet.all
        vets.to_json(
            only: [:vet_name, :specialty], 
            include: :patients
        )
    end

    # /vets/:id => Retrieve an Individual Vet via Params (:id)
    # BONUS => Include Vet's Associated Appointments
    get '/vets/:id' do
        vet = Vet.all.find(params[:id])
        vet.to_json(include: :appointments)
    end
end 