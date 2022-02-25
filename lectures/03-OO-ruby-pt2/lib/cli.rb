$patients = [
    { species:"dog", age: "2", name:"Jack", owner:"John Smith", phone: "999-999-9999"},
    { species:"bird", age: "3", name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
    { species:"cat", age: "4", name:"Grace", owner:"Louis", phone: "777-777-7777"},
    # duplicate record 
    { species:"cat", age: "4", name:"Grace", owner:"Louis", phone: "777-777-7777"},
]

$clinics = [
    { clinic_name: "Flatiron Veterinary Clinic", address: "111 Hacker Way", phone: "777-777-7777"},
    { clinic_name: "Bakersville Veterinary Clinic", address: "222 Hyde Street", phone: "666-666-6666"},
    { clinic_name: "Pets R Us", address: "333 Animal Way", phone: "555-555-5555"},
]

def initialize_app
    seed
    menu
end

def try_again
    puts "Sorry, that option doesn't exist. Please try again!"
    menu
end

def return_to_menu
    puts "Press any key to return"
    gets.strip
    menu
end

def search
    puts "Enter a patient name:"
    name = gets.strip
    puts "Enter a patient owner:"
    owner = gets.strip

    
    if Patient.find_patient(name, owner)
        puts "Patient Found: #{Patient.find_patient(name, owner)}"
    else
        puts "No Patient Found"
    end
end

def is_found(id)
    Patient.all.find { |p| p.id.to_s == id}
end

def menu
    puts "_______________________________________________________"
    puts "\n" + "Welcome to Flatiron Veterinary Clinic!" + "\n\n"
    puts "Please choose an option:" ++ "\n\n"
    puts "1. List All Patients"
    puts "2. List All Clinics"
    puts "3. List Patient Species"
    puts "4. List Clinic Names"
    puts "5. Add New Patient"
    puts "6. Find Patient"
    puts "7. Delete Patient"
    puts "0. Exit" + "\n\n"

    # initial user input prompt
    print "Enter Your Prompt: "
    user_input = gets.strip

    case user_input

    when "7"
        puts "Please enter an ID"
        
        # get ID from user
        id = gets.strip 

        # find a Patient by id
        
        # binding.pry

        if is_found(id)
            patient = Patient.all.find { |p| p.id.to_s == id }
            patient.delete_patient
        else
            puts "No Patient Found"
        end
        return_to_menu
    when "6"
        search
        return_to_menu
    when "5"
        create_patient
        return_to_menu
    when "4"
        clinics_array = $clinics.map{|clinic| 
            "Clinic Name: #{clinic[:clinic_name]}"
        }

        puts clinics_array

        return_to_menu
    when "3"
        # .map returns an Array
        puts Patient.all_species
        return_to_menu
    when "2"
        $clinics.each { |clinic| 
            puts "Clinic Hash Object: #{clinic}"
        }
        return_to_menu
    when "1"
        if Patient.all.length != 0
            puts "\n"
            Patient.all.each { |patient| 
                puts "_______________________"
                puts "ID: #{patient.id}" 
                puts "Species: #{patient.species}" 
                puts "Age: #{patient.age}"
                puts "Name: #{patient.name}"
                puts "Owner: #{patient.owner}"
                puts "Phone: #{patient.phone}"
                puts "_______________________"
            }

            return_to_menu
        else
            puts "\n" + "No Patients!"
            return_to_menu
        end
        # menu      
    when "0"
        puts "Goodbye!"
    else
        try_again
    end
end
    
def create_patient
    puts "Please enter a patient species"
    new_species = gets.strip!
    puts "Please enter a patient age"
    new_age = gets.strip!
    puts "Please enter a patient name"
    new_name = gets.strip!
    puts "Please enter a patient owner"
    new_owner = gets.strip!
    puts "Please enter a patient phone"
    new_phone = gets.strip!

    # create hash literal for each new_patient
    # new_patient = {
    #     id: $patients.length + 1,
    #     species: new_species,
    #     name: new_name,
    #     owner: new_owner,
    #     phone: new_phone
    # }

    # species, age, name, owner, phone
    p1 = Patient.new({
        id: Patient.all.length + 1,
        species: new_species, 
        age: new_age, 
        name: new_name,
        owner: new_owner,
        phone: new_phone
    });
end

def seed
    $patients.each { |p| Patient.new({
        id: Patient.all.length + 1,
        species: p[:species],
        age: p[:age],
        name: p[:name],
        owner: p[:owner],
        phone: p[:phone]
    })}
end

# New Patient Logic (End)