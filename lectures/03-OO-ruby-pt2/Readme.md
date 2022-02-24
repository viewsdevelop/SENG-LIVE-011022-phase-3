# Object Orientation in Ruby (Part 2)
### SWBAT
- [x] Understand the fundamentals of ruby Classes 
- [x] Create instances of a Class in 
- [x] Use the initialize method to add attributes
- [x] Use setters and getters with attribute macros
- [x] Understand instance methods
- [x] Understand class variables and self
- [ ] CRUD in ruby
- [ ] aggregate methods
- [ ] inheritance 

# Run the APP

1. In the Terminal directory `02-OO-ruby-pt2`, run  `ruby ./bin/run.rb` to start the CLI
2. If the following error message is returned: zsh: permission denied: ./bin/run.rb, run the following command: `chmod +x ruby ./bin/run.rb`

# CRUD
- We will practice CRUD using Enumerable methods. 
- Enumerable methods allow us to traverse, collect, sort and search through ruby data.
- Active record will eventually give us these methods, BUT going through them helps us understand how they are working.
- Some aggregate methods aren't provided by Active Record.

## Class Inheritance
- Allows class's to inherit functionality and behavior from superclasses

```
class Animal
end 

#Cat is inheriting from Animal
class Cat < Animal
end 
```