def sign_in(email = "test@example.com",
            password = "orange")
  click_button "Sign In"
  fill_in "email", :with => email
  fill_in "password", :with => password
  click_button "Start Posting!"
end