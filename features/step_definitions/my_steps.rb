linkedin=Sign_in.new
Given(/^I am on welcome home page$/) do
  linkedin.linkedin_url
end
When(/^I click on sign in button$/) do
  linkedin.sign_in_button
end

Then("I should see Sign in page") do
  puts(linkedin.sign_in_page_heading)

end

Given(/^I am on Sign in page$/) do
  linkedin.sign_in_page
end

When(/^I enter (.*) and (.*)$/) do |emailorphone, password|
  linkedin.credentials(emailorphone,password)
end

And(/^click on sign in button$/) do
  linkedin.login_button
end

Then(/^I should be able to Sign in$/) do
  linkedin.sign_in_status
end