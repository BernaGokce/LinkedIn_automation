Given(/^I am at linkedin login page$/) do
  visit('https://www.linkedin.com/uas/login')
end

When(/^I type wrong username: "([^"]*)" and random password: "([^"]*)"$/) do |username, password|
  find($login_page['#session_key-login']).set username
  find($login_page['#session_password-login']).set password
  find($login_page['#btn-primary']).click
end

Then(/^I get "([^"]*)"$/) do |error|
  expect(find('#session_password-login-error').test).to eq(error)
  expect(find('.div.alert.error').test).to eq(error)
  expect(find('#session_key-login-error')).to eq(error)
end

When(/^I type username: "([^"]*)" and password: "([^"]*)"$/) do |username, password|
  Capybara.default_max_wait_time = 5
  find($login_page['email_input']).set username
  find($login_page['password_input']).set password
  find($login_page['login_button']).click
end

Then(/^I can see my username: "([^"]*)"$/) do |username|
  Capybara.default_max_wait_time = 5
  page.should have_content(username)
end

Given(/^I am at my linkedin profile$/) do
  Capybara.default_max_wait_time = 5
end

When(/^I click Publish a post$/) do
  find($profile_page['publish_button']).click
  page.should have_content("Your Posts")
end

And(/^I type head:"([^"]*)" and post: "([^"]*)"$/) do |myheader, mypost|
  Capybara.default_max_wait_time = 5
  find($post_page['post_header']).set myheader
  find($post_page['post_space']).set mypost
  find($post_page['publish_button']).click
end

Then(/^I can see my post: "([^"]*)" and my topic:"([^"]*)"$/) do |post, topic|
  page.should have_content(post)
  page.should have_content(topic)
end

When(/^I click Update Status$/) do
  find($profile_page['updatestatus_button']).click
end

And(/^I type textplane : "([^"]*)"$/) do |newstatus|
  Capybara.default_max_wait_time = 5
  find($profile_page['status_space']).set newstatus
  page.should have_content("Public")
  find($profile_page['share_button']).click
end

Then(/^I can see my status: "([^"]*)" and button: "([^"]*)"$/) do |status, button|
  Capybara.default_max_wait_time = 5
  page.should have_content(status)
  page.should have_content(button)
end

When(/^I add new position$/) do
  find($user_profile_page['add_education']).click
end

And(/^I type school: "([^"]*)" , degree: "([^"]*)" , field: "([^"]*)" and description: "([^"]*)"$/) do |school, degree, field, description|
  find($user_profile_page['add_school']).set school
  find($user_profile_page['add_degree']).set degree
  find($user_profile_page['add_field']).set field
  find($user_profile_page['add_description']).set description
  find($user_profile_page['add_button']).click
end

Then(/^I should see text: "([^"]*)" and header : "([^"]*)"$/) do |text, header|
  page.should have_content(text)
  page.should have_content(header)
end


