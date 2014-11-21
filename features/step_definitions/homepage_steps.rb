Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^there are no posts$/) do
  # Expect test database to have no posts
end

Then(/^I should be told there is nothing to see$/) do
  # Display text on homepage indicating that there are no posts, ask to log in and post. 
end