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
  find($login_page['email_input']).set username
  find($login_page['password_input']).set password
  find($login_page['login_button']).click
end

Then(/^I can see my username: "([^"]*)"$/) do |username|
  expect(page).to have_field("user_name_field", with: username)
  #page.should have_content(username)
end

Given(/^I am at my linkedin profile$/) do
  Capybara.sleep 1
end

When(/^I type head:"([^"]*)" and post: "([^"]*)"$/) do |myheader, mypost|
  find($profile_page['publish_button']).click
  find($post_page['post_header']).set myheader
  find($post_page['post_space']).set mypost
  find($post_page['publish_button']).click
end

Then(/^I can see my post: "([^"]*)" and my topic:"([^"]*)"$/) do |post, topic|
  expect(page).to have_field("publish_post_field", with: post)
  expect(page).to have_field("publish_post_field", with: topic)
  #page.should have_content(post)
  #page.should have_content(topic)
end

When(/^I type textplane : "([^"]*)" , select : "([^"]*)" and upload a picture$/) do |newstatus, selectoption|
  find($profile_page['updatestatus_button']).click
  find($profile_page['status_space']).set newstatus
  select(selectoption, :from => $profile_page['select_option'])
  #page.should have_content(selectoption)
  find($profile_page['upload_photo']).click
  attach_file('upload_photo', '/Users/bgokce/Desktop/url.png')
  find($profile_page['share_button']).click
end

Then(/^I can see my status: "([^"]*)" and button: "([^"]*)"$/) do |status, button|
  expect(page).to have_field("update_status_text", with: status)
  expect(page).to have_field("update_status_action_field", with: button)
  #page.should have_content(status)
  #page.should have_content(button)
end

When(/^I type school: "([^"]*)" , degree: "([^"]*)" , field: "([^"]*)" and description: "([^"]*)"$/) do |school, degree, field, description|
  find($user_profile_page['add_education']).click
  find($user_profile_page['add_school']).set school
  find($user_profile_page['add_degree']).set degree
  find($user_profile_page['add_field']).set field
  find($user_profile_page['add_description']).set description
  find($user_profile_page['add_button']).click
end

Then(/^I should see text: "([^"]*)" and header : "([^"]*)"$/) do |text, header|
  expect(page).to have_field("education_field", with: text)
  expect(page).to have_field("education_field", with: header)
  #page.should have_content(text)
  #page.should have_content(header)
end

When(/^I do nothing$/) do
  find($profile_page['updatestatus_button']).click
  Capybara.sleep 1
  find($profile_page['share_button']).click
end

When(/^I comment "([^"]*)"$/) do |blank|
  find($profile_page['updatestatus_button']).click
  find($profile_page['status_space']).set blank
  select(selectoption, :from => $profile_page['select_option'])
end

Then(/^I should still see Status field$/) do
  expect(page).to have_field("update_status_hole_field")
end


When(/^I comment js: "([^"]*)" and select : "([^"]*)"$/) do |js, selectoption|
  find($profile_page['updatestatus_button']).click
  find($profile_page['status_space']).set js
  select(selectoption, :from => $profile_page['select_option'])
end

Then(/^I should see it as a status on my profile$/) do
  expect(page).to have_field("update_status_hole_field")
end

When(/^I type "([^"]*)" characters to field "([^"]*)"$/) do |characterCount, fieldName|
  find($profile_page['updatestatus_button']).click
  find($profile_page[fieldName]).set(characterCount * 'x')
  select(selectoption, :from => $profile_page['select_option'])
  find($profile_page['share_button']).click
end

Then(/^I can see error : "([^"]*)"$/) do |error|
  find($profile_page['status_space']).set error
end