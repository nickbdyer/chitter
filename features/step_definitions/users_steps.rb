require_relative "../support/users_helper"

Given(/^I sign up$/) do
  sign_up
end

Then(/^I should be asked to sign in$/) do
  expect(page).to have_content "Enter your details to sign in."
end

Given(/^I sign up with non matching passwords$/) do
  sign_up("tester", "Test Man", "test@example.com", "orange", "apple")
end

Then(/^I should be told my passwords don't match$/) do
  expect(page).to have_content "Sorry, your passwords don't match"
  expect(page).not_to have_content "Enter your details to sign in."
end

Then(/^I should be shown the form with name, username and email filled out$/) do
  expect(page).to have_field('username', with: "tester")
  expect(page).to have_field('name', with: "Test Man")
  expect(page).to have_field('email', with: "test@example.com")
end

Given(/^I sign up with duplicate email$/) do
  sign_up("tester", "Test Man", "test@example.com", "orange", "orange")
  sign_up("tester2", "Test Man", "test@example.com", "orange", "orange")
end

Then(/^I should be told my email is already taken$/) do
  expect(page).to have_content "Sorry, the email you entered is already registered."
  expect(page).not_to have_content "Enter your details to sign in."
end

Then(/^I should be shown the form with name and username filled out$/) do
  expect(page).to have_field('username', with: "tester2")
  expect(page).to have_field('name', with: "Test Man")
  expect(page).to have_field('email', with: nil)
end

Given(/^I sign up with duplicate username$/) do
  sign_up("tester", "Test Man", "test@example.com", "orange", "orange")
  sign_up("tester", "Test Man", "supertest@example.com", "orange", "orange")
end

Then(/^I should be told my username is already taken$/) do
  expect(page).to have_content "Sorry, the username you entered is already taken."
  expect(page).not_to have_content "Enter your details to sign in."
end

Then(/^I should be shown the form with name and email filled out$/) do
  expect(page).to have_field('username', with: nil)
  expect(page).to have_field('name', with: "Test Man")
  expect(page).to have_field('email', with: "supertest@example.com")
end