Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^there are no posts$/) do
  expect(Post.count).to eq 0
end

Then(/^I should be told there is nothing to see$/) do
  expect(page).to have_content "There are no posts here. Sign in to add a post."
end