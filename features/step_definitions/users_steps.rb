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

Given(/^I sign up with non matching passwords$/) do
  click_link "Sign Up"
  fill_in "username", :with => "tester"
  fill_in "name", :with => "Test Man"
  fill_in "email", :with => "test@example.com"
  fill_in "password", :with => "orange"
  fill_in "password_confirmation", :with => "apple"
  click_button "Submit"
end

Then(/^I should be told my passwords don't match$/) do
  expect(page).to have_content "Sorry, please make sure your passwords match."
  expect(page).not_to have_content "Enter your details to sign in."
end

Then(/^I should be asked to correct only the bad information$/) do
  expect(page).to have_field('username', with: "tester")
  expect(page).to have_field('name', with: "Test Man")
  expect(page).to have_field('email', with: "test@example.com")
end