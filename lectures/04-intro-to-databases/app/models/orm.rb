class PatientORM
    attr_accessor :name, :age, :owner, :number, :id
    attr_reader :species

    # Will this create a new record in DB or not?
    def initialize(attributes)
        # ACTIVITY 1 => Use mass assignment to allow attributes to be 
        # passed into initialize() as key / value pairs

        # PatientORM.new(
        #     name: "Grace", 
        #     age: 1, 
        #     owner: "Sally",
        #     number: 2,
        #     species: "Cat"    
        # )

        # method hints => ".each", ".respond_to?", ".send"

        # iterate over attributes
        attributes.each do |key, value| 
            
            # make sure that the key exists for what we're trying
            # to create
            if self.respond_to?("#{key.to_s}=") 
                
                # send key / value pairing
                self.send("#{key.to_s}=", value) 
            end 
        end
    end

    def save
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) 
        # to create a string that runs on to multiple lines.
        sql = <<-SQL
        INSERT INTO patients (species, name, age, owner, number) VALUES (?,?,?,?,?);        
        SQL
        
        # ACTIVITY 1 => Use "execute" and "last_insert_row_id" to add new
        # PatientORM class instances to DB with appropriate IDs

        # NOTE => Remember to return "self" instance
        DB.execute(sql, self.species, self.name, self.age, self.owner, self.number)
        @id = DB.last_insert_row_id
        
        # return new patient instance
        self 
    end

    def self.create(args)
        # ACTIVITY 2 => Use "new" and "save" to simultaneously 
        # create / add new PatientORM class instances to DB
        
        # NOTE => Remember to return "patient" instance

        # Instantiate PatientORM Class
        patient = PatientORM.new(args)
        
        # Save patient to DB
        patient.save
        
        # Return new patient instance
        patient
    end

    def self.all 
        # ACTIVITY 2 => Use "DB.execute()" + SQL to retrieve all 
        # patients from table.

        resources = DB.execute("SELECT * FROM patients")
        
        # HINT => Use ".map" and "self.new" to create an array of "mapped_resources"
        mapped_resources = resources.map do |patient|
            self.new(patient)
        end

        mapped_resources
        # NOTE => Remember to return "mapped_resources" as an iterable (countable) list
        # of patients
    end

    def self.create_table 
        
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) to create a string that 
        # runs on to multiple lines.
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS patients (
            id INTEGER PRIMARY KEY,
            clinic_id INTEGER,
            species TEXT,
            name TEXT,
            age INTEGER,
            owner TEXT,
            number TEXT
        );
        SQL
        DB.execute(sql)
    end 
end 