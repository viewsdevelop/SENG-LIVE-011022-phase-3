# Run the APP
1. In Terminal, `cd` into `veterinary_clinic`
2. Run `bundle install`
3. Run  `ruby ./bin/run.rb` to start the CLI
4. If the following error message is returned: `zsh: permission denied: ./bin/run.rb`, run the following command: `chmod +x ruby ./bin/run.rb`

# Deliverables 
A local veterinary clinic has asked you to make a CLI app to help them track their patients and those at other nearby clinics.

Today, we will add more advanced class & instance methods to the `Patient` class.

## Break Out Activity #1

1. Let's continue to clean up `cli.rb`. Add a method, `try_again`, that outputs `Sorry, that option doesn't exist. Please try again.` to Terminal before re-running `menu`. In what part(s) of our code should we expect to invoke `try_again`?

2. Add a method, `return_to_menu`, that (1) outputs `Press any key to return.`, (2) accepts any given input from the user, and (3) re-runs `menu`. In what part(s) of our code should we expect to invoke `return_to_menu`?

3. Add a method (`seed`) that iterates over the `$patients` array and creates a new `Patient` instance for each hash element. Call `seed` within `initialize_app` to load up `@@all` with new `Patient` instances on each application run. Confirm your results by placing a `binding.pry` and / or running `1. List All Patients`. (Hint: https://apidock.com/ruby/Enumerator/each)

## Break Out Activity #2

4. In `Patient.rb`, add a class method (`all_species`) that maps over all `Patient` class instances (`@@all`) and returns a unique array of Patient `species`. Confirm your results using `binding.pry` before outputting this array to Terminal. Note that there should be no duplicate `species` listed! (Hint: https://apidock.com/ruby/Array/uniq)

5. In `Patient.rb`, add a class method (`find_patient`) that accepts two parameters, `name` and `owner`. Use these values to search through `@@all` and return the first `Patient` with matching `name` and `owner`. (Hint: https://apidock.com/ruby/Enumerable/find)

6. Add an instance method (`delete_patient`) that reassigns `@@all` to contain `Patient` instances other than the one in question (i.e., `self`). Try using `filter` along with any necessary comparison logic before outputting the following: `"#{<INSTANCE NAME>} was removed from the system."`. (Hint: https://apidock.com/ruby/Enumerable/filter)

### Bonus

7. In `Patient.rb`, make `initialize` more flexible by assigning attributes to new `Patient` instances via mass assignment. What advantages does using this approach confer? (Hint: https://apidock.com/ruby/Object/send) 