# Deliverables

# NOTE => Try adding 'binding.pry' at different points in your code!

# Bonus - Global Variables
# https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/globalvars.html

$patients = [
    { id: 1, species:"dog", name:"Jack", owner:"John Smith", phone: "999-999-9999"},
    { id: 2, species:"bird", name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
    { id: 3, species:"cat", name:"Grace", owner:"Louis", phone: "777-777-7777"},
]

$clinics = [
    { id: 1, clinic_name: "Flatiron Veterinary Clinic", address: "111 Hacker Way", phone: "777-777-7777"},
    { id: 2, clinic_name: "Bakersville Veterinary Clinic", address: "222 Hyde Street", phone: "666-666-6666"},
    { id: 3, clinic_name: "Pets R Us", address: "333 Animal Way", phone: "555-555-5555"},
]

def initialize_app
    
    # puts => output string
    puts 'welcome to phase-3'
    puts "Welcome to Flatiron Veterinary Clinic!"
    puts "Please choose an option:"
    puts "1. List All Patients"
    puts "2. List All Clinics"
    puts "3. List Patient Species"
    puts "4. List Clinic Names"
    puts "5. Add New Patient"
    puts "0. Exit"

    # gets => get string
    user_input = gets.strip
        
    def create_patient
        puts "Please enter a patient species"
        new_species = gets.strip
        puts "Please enter a patient name"
        new_name = gets.strip
        puts "Please enter a patient owner"
        new_owner = gets.strip
        puts "Please enter a patient phone"
        new_phone = gets.strip

        new_patient = {
            id: $patients.length + 1,
            species: new_species,
            name: new_name,
            owner: new_owner,
            phone: new_phone
        }

        $patients << new_patient
        
        # alternative syntax for pushing new Patient
        # to $patients array
        # $patients.push(new_patient)
        
        puts $patients
    end

    # if / else Statement
    # if user_input == "1"
    #     # binding.pry
    
    #     patients.each do |patient|
    #         # binding.pry
    #         puts patient[:species]
    #     end
    # end

    # Case Statement => Better for Numerous Options / Scalable
    case user_input
    
    when "5"
        create_patient()
    when "4"
        # .map returns an Array
        clinics_array = $clinics.map{|clinic| clinic[:clinic_name]}
        puts clinics_array
    when "3"
        # .map returns an Array
        patients_array = $patients.map{|patient| patient[:species]}
        puts patients_array
    when "2"
        $clinics.each { |clinic| puts clinic }
    when "1"
        $patients.each { |patient| puts patient }
    when "0"
        puts "Goodbye!"
    end
end 

