require_relative "../support/sessions_helper"

Given(/^I am not signed in$/) do
  expect(page).not_to have_content("Welcome, tester")
end

Then(/^I should sign in$/) do
  sign_up
  sign_in
  expect(page).to have_content("Welcome, tester")
end