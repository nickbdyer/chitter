Given(/^I sign up$/) do
  click_link "Sign Up"
  fill_in "username", :with => "tester"
  fill_in "name", :with => "Test Man"
  fill_in "email", :with => "test@example.com"
  fill_in "password", :with => "orange"
  fill_in "password_confirmation", :with => "orange"
  click_button "Submit"
end

Then(/^I should be asked to sign in$/) do
  expect(page).to have_content "Enter your details to sign in."
end