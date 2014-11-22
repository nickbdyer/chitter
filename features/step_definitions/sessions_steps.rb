require_relative "../support/sessions_helper"

Given(/^I am not signed in$/) do
  expect(page).not_to have_content("Welcome, tester")
end

Then(/^I should sign in$/) do
  sign_up
  sign_in
  expect(page).to have_content("Welcome, tester")
end

Given(/^I try to sign in$/) do
  sign_up
  sign_in("test@example.com", "wrongpassword")
  expect(page).not_to have_content("Welcome, tester")
end

Then(/^I should be told my information was incorrect$/) do
    expect(page).to have_content("The email or password is incorrect")
end