def sign_up(username = "tester",
            name = "Test Man",
            email = "test@example.com",
            password = "orange", 
            password_confirmation = "orange")
  click_button "Sign Up"
  fill_in "username", :with => username
  fill_in "name", :with => name
  fill_in "email", :with => email
  fill_in "password", :with => password
  fill_in "password_confirmation", :with => password_confirmation
  click_button "Submit"
end