class Patient
    attr_accessor :id, :species, :age, :name, :owner, :phone

    # Patient.new(params)
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.send("#{key}=", value)
        end

        add_self
    end

    # Class Methods

        # Patient.all
        # self => Patient class
        def self.all
            @@all
        end

        def self.all_species
            self.all.map { |p| p.species }.uniq
            # @@all.map { |p| p.species }.uniq
        end

        # { species:"dog", age: "2", name:"Jack", owner:"John Smith", phone: "999-999-9999"},
        def self.find_patient(name, owner)
            # self.all
            # find => Returns the first matching instance
            patient = @@all.find { |p| p.name == name && p.owner == owner }
            
            if patient 
                patient.name 
            end
        end

    # Instance Methods

        # new_patient.give_name
        def give_name
            @name
        end 

        def delete_patient
            # binding.pry
           
            @@all = @@all.filter { |p| p != self }
           puts "#{self.name} was removed from the system."
        end

    private

    def add_self
        # self => new Patient instance
        @@all << self
    end
end

class Cat < Patient
    # Inherits instance / class methods, etc. 
end

# new_cat = Cat.new
# new_cat.give_name => "Milo"