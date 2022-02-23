# Add necessary Patient Class logic here! (See Activity.md)

class Patient
    # attr_writer => Sets
    # attr_reader => Gets
    # attr_accessor => Sets / Gets

    # attr_reader :id
    attr_accessor :species, :age, :name, :owner, :phone

    # all patients => []
    # Class variable
    @@all = []

    def initialize(species, age, name, owner, phone)
        
        # instance variables
        @species = species # p1.species => "Dog"        
        @age = age # p1.age = "5"
        @name = name # p1.name = "Spot"
        @owner = owner # p1.owner = "Sally"
        @phone = phone # p1.phone = "123-456-7890"
        
        # self => new Patient instance
        @@all << self
    end

    # Class method
    # self => Patient class
    def self.all
        @@all
    end

    # Instance method
    def give_name
        @name
    end
end