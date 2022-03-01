# Activity #2 => Using Seed Data

# Create two Clinics and five Patients, making sure to associate
# each Patient with one Clinic via the "clinic_id" foreign key.

# Run 'rake db:seed' to add this information to your DB, making sure
# to verify that the DB has been populated with the appropriate resources.

# BONUS => What Rake command would we run to ensure that our DB doesn't
# contain duplicate data? Add another Clinic and re-seed your DB before confirming 
# that there are no duplicates (i.e., 3 Clinics instead of 5).

# Create and Persist Clinics to DB

c1 = Clinic.create({clinic_name:'puppersRus', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999'})
c2 = Clinic.create({clinic_name:'Seattle pets clinic', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999'})
c2 = Clinic.create({clinic_name:'Seattle pets clinic', address:'5555 6th Seattle Wa 00000', phone:'(999)999-9999'})

# Create and Persist Patients to DB

Patient.create({species:'cat', name:'rose', age:10, owner:'ix', phone:'999999999', active:true, clinic_id:c1.id})
Patient.create({species:'cat', name:'bob', age:9, owner:'tom', phone:'999999999', active:true, clinic_id:c1.id})
Patient.create({species:'dog', name:'dan', age:2, owner:'max', phone:'999999999', active:true, clinic_id:c1.id})
Patient.create({species:'bird', name:'picard', age:2, owner:'oz', phone:'999999999', active:true, clinic_id:c2.id})
Patient.create({species:'rabbit', name:'ted', age:1, owner:'zac', phone:'999999999', active:true, clinic_id:c2.id})

# Confirmation Message
puts 'Seeding complete!'