# Note => Run "rake db:seed:replant" to populate DB following successful migrations.

# Create Clinics

c1 = Clinic.create({clinic_name:'puppersRus', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999'})
c2 = Clinic.create({clinic_name:'Seattle pets clinic', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999'})

# Create Patients

p1 = Patient.create({species:'cat', name:'rose', age:10, owner:'ix', phone:'999999999', active:true, clinic_id:c1.id})
p2 = Patient.create({species:'cat', name:'bob', age:9, owner:'tom', phone:'999999999', active:true, clinic_id:c1.id})
p3 = Patient.create({species:'dog', name:'dan', age:2, owner:'max', phone:'999999999', active:true, clinic_id:c1.id})
p4 = Patient.create({species:'bird', name:'picard', age:2, owner:'oz', phone:'999999999', active:true, clinic_id:c2.id})
p5 = Patient.create({species:'rabit', name:'ted', age:1, owner:'zac', phone:'999999999', active:true, clinic_id:c2.id})

# Create Vets

# v1 = Vet.create({vet_name:'Anderson', specialty:'cats and dogs'})
# v2 = Vet.create({vet_name:'Boe', specialty:'cats and dogs'})
# v3 = Vet.create({vet_name:'Yasha', specialty:'small pets'})
# v4 = Vet.create({vet_name:'Randol', specialty:'small pets'})

# Create Appointments

# Appointment.create(patient_id:p1.id, vet_id:v1.id, date:Date.new(2021,10,5))
# Appointment.create(patient_id:p1.id, vet_id:v1.id, date:Date.new(2020,9,21))
# Appointment.create(patient_id:p1.id, vet_id:v2.id, date:Date.new(2019,3,11))

# Appointment.create(patient_id:p2.id, vet_id:v3.id, date:Date.new(2021,11,5))
# Appointment.create(patient_id:p2.id, vet_id:v2.id, date:Date.new(2020,8,21))
# Appointment.create(patient_id:p2.id, vet_id:v2.id, date:Date.new(2019,2,11))

# Appointment.create(patient_id:p3.id, vet_id:v1.id, date:Date.new(2021,1,10))
# Appointment.create(patient_id:p3.id, vet_id:v2.id, date:Date.new(2020,8,20))
# Appointment.create(patient_id:p3.id, vet_id:v2.id, date:Date.new(2019,4,23))

# Appointment.create(patient_id:p4.id, vet_id:v3.id, date:Date.new(2021,3,5))
# Appointment.create(patient_id:p4.id, vet_id:v3.id, date:Date.new(2020,5,15))
# Appointment.create(patient_id:p4.id, vet_id:v4.id, date:Date.new(2019,8,9))

# Appointment.create(patient_id:p5.id, vet_id:v4.id, date:Date.new(2021,11,5))
# Appointment.create(patient_id:p5.id, vet_id:v4.id, date:Date.new(2020,12,5))
# Appointment.create(patient_id:p5.id, vet_id:v4.id, date:Date.new(2019,1,5))

# Confirmation Message
puts 'Seeding complete!'