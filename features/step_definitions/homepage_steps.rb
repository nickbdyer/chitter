Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^there are no posts$/) do
  expect(Post.count).to eq 0
end

Then(/^I should be told there is nothing to see$/) do
  expect(page).to have_content "There are no posts here. Sign in to add a post."
end

Given(/^there are posts$/) do
  sign_up
  sign_in
  Post.create(body: "Hello World", 
              author: "frankie", 
              created_at: Time.now, 
              user_id: 1)
  expect(Post.count).to eq 1
end

Then(/^I should see the posts$/) do
  visit '/'
  expect(page).to have_content "Hello World"
end