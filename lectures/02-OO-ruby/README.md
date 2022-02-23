# Object Orientation in Ruby (Part 1)

### Learning Objectives
- [] Understand the fundamentals of Ruby Classes 
- [] Create instances of classes in Ruby
- [] Use the `initialize` method to add instance attributes
- [] Use setters and getters with attribute macros (i.e., `attr_accessor`, etc.)
- [] Understand instance methods
- [] Understand class variables and `self`


# Object-Orientation
- Abstraction, polymorphism, inheritance and encapsulation form four of the main pillars of OOP
- What is an object? An object is a combination of data and behaviors.
- In Ruby, (almost) everything is an object. Every bit of information and code can be given their own properties and actions (aka methods).

## Class
- An object-making "blueprint"
- Allows us to make consistent attributes and methods
- Capitalized and singular
- `initialize`
    - a special method belonging to classes that allow us to add instance attributes
    - `@variable_name` are instance variables, special variables that belong to the instance of the class
    - `@@variable_name` are class variables that belong to the class themselves
- `.new` creates an instance 
- `self` can reference the class / instance being created

```
class Doctor
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
end 

d1 = Doctor.new('Paul')
```

## Getters and Setters
- we need attribute macros to access and change instance variables 
- `attr_reader` -> reads the instance variable  (getter)
- `attr_writer` -> changes an instance variable (setter)
- `attr_accessor` -> does both (getter and setter)
```
attr_accessor :name, :age, :owner, :phone
# attr_reader :name
# attr_writer :name

d1.name 
d1.name = 'Tod'

```

## Getting Class Variables with Class Methods
- To "get" (retrieve) a class variable, it's common to write a class method using `self`.

```
def self.all
    @@all
end

Patient.all
```