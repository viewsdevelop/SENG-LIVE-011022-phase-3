# Run the APP
1. In Terminal, `cd` into `veterinary_clinic`
2. Run `bundle install`
3. Run  `ruby ./bin/run.rb` to start the CLI
4. If the following error message is returned: `zsh: permission denied: ./bin/run.rb`, run the following command: `chmod +x ruby ./bin/run.rb`

# Deliverables 
A local veterinary clinic has asked you to make a CLI app to help them track their patients and those at other nearby clinics.

Today, we'll be creating a `Patient` class to add consistency / reusability and expand on existing features.

## Break Out Activity #1

1. Start by cleaning up the CLI. Compartmentalize the menu logic into it's own method, `menu()`. Call `menu()` inside of `initialize_app`. What are the benefits of organizing our code in this manner?

2. Create a `Patient` Class in `Patient.rb`. Back in `cli.rb`, refactor `create_patient` to `puts Patient.new` to the Terminal console. Test that a Patient is being created. You should see `#<Patient:some mix of numbers and characters>` in your Terminal console.

3. In the Patient class, create an `initialize` method that takes `species`, `age`, `name`, `owner` and `phone`  as params. Create corresponding instance variables (i.e., `@species`) for these params, assigning their values as necessary.

## Break Out Activity #2

4. In `cli.rb`, refactor `create_patient` to use `gets.strip` to get `species`, `age`, `name`, `owner`, and `phone` from the user. Use those inputs as arguments in an invocation of `Patient.new`. Assign `Patient.new` to a variable `p1`. (You wont be able to access new Patient attributes quite yet)

5. In `Patient.rb`, add `attr_accessor` to the top of the class alongside `species`, `age`, `name`, `owner`, and `phone`. Add a `binding.pry` to the bottom of `create_patient` in `cli.rb`. Run the app and test your code. When you get to the `binding.pry`, verify that you can read a new Patient's species, age, name, owner, and phone with `p1.species`, `p1.age`, `p1.name`, `p1.owner`, and `p1.phone`. To assure that you can write to these instance variables, try setting the `age` to a new value.

6. Add a new class variable, `@@all`, to the `Patient` class. Shovel `self` into `@all` at the end of `initialize`. Create a class method (i.e., `self.all`) that returns `@@all`.

### Bonus

9. In `cli.rb`, refactor the `"1"` case block to iterate over `Patient.all` and print every patient's name. To check your work,  run your app, create a few patients and run `"1. List All Patients"`