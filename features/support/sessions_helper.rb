def sign_in(email = "test@example.com",
            password = "orange")
  click_link "Sign In"
  fill_in "email", :with => email
  fill_in "password", :with => password
  click_button "Sign In"
end