Given(/^I add a post$/) do
  sign_up
  sign_in
  fill_in "body", :with => "Ciao"
  click_button "Post"
end

Then(/^I should be able to see that post$/) do
  expect(page).to have_content "Ciao"
end