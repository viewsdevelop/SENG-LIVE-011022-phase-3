puts "🌱 Seeding...."

# Create Clinics
c1 = Clinic.create(clinic_name:'puppersRus', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999')
c2 = Clinic.create(clinic_name:'Seattle pets clinic', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999')

# Create Vets
specialty = ['cats', 'dogs', 'small pets', 'farm animals']
species = ['cat', 'dog', 'bird', 'fish', 'horse', 'chicken', 'cow', 'rat']
10.times {Vet.create(vet_name:Faker::Name.name, specialty:specialty.sample)}

# Create Patients
30.times {
    Patient.create(
        species:species.sample, 
        name:Faker::Name.first_name , 
        age:rand(1..10), 
        owner:Faker::Name.name, 
        phone:Faker::PhoneNumber.cell_phone , 
        active:true, 
        clinic_id:Clinic.all.sample.id
)}

# Create Appointments
150.times {
    Appointment.create(
        patient_id:Patient.all.sample.id, 
        vet_id:Vet.all.sample.id, 
        date:Faker::Date.between(from: 2.days.ago, to: Date.today)
)}


puts "✅ Done seeding!"
