Given(/^I am at linkedin login page$/) do
  visit('https://www.linkedin.com/uas/login')
end

When(/^I type wrong username: "([^"]*)" and random password: "([^"]*)"$/) do |username, password|
  find($login_page['#session_key-login']).set username
  find($login_page['#session_password-login']).set password
  find($login_page['#btn-primary']).click
end

Then(/^I get "([^"]*)"$/) do |error|
  expect(find('#session_key-login-error').test).to eq(error)
end

When(/^I type username: "([^"]*)" and password: "([^"]*)"$/) do |username, password|
  sleep 6
  find($login_page['email_input']).set username
  find($login_page['password_input']).set password
  find($login_page['login_button']).click
end

Then(/^I am at my linkedin profile$/) do
  sleep 5
  page.should have_content("Berna Gökçe")
end

When(/^I click Publish a post$/) do
  find($profile_page['publish_button']).click
  page.should have_content("Your Posts")
end

And(/^I type head:"([^"]*)" and post: "([^"]*)"$/) do |myheader, mypost|
  sleep 4
  find($post_page['post_header']).set myheader
  find($post_page['post_space']).set mypost
  find($post_page['publish_button']).click
end

Then(/^I can see my post on my profile$/) do
  sleep 8
  page.should have_content("Berna Gökçe")
  page.should have_content("QA things")
end

When(/^I click Update Status$/) do
  find($profile_page['updatestatus_button']).click
end

And(/^I type textplane : "([^"]*)"$/) do |newstatus|
  sleep 5
  find($profile_page['status_space']).set newstatus
  page.should have_content("Public")
  find($profile_page['share_button']).click
end

Then(/^I can see my new post on my profile$/) do
  sleep 5
  page.should have_content("Berna Gökçe")
  page.should have_content("Like")
end

When(/^I logout$/) do
  find($profile_page['publish_button']).click
  sleep 2
end

Then(/^I am at Linkedin home page$/) do
  page.should have_content("Graduate Quality Analyst at ThoughtWorks")
end