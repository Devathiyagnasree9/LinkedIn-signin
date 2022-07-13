Given(/^I am on welcome home page$/) do
  $driver.get "https://in.linkedin.com"
end

When(/^I click on sign in button$/) do
  $driver.find_element(:class, "nav__button-secondary").click()
end

Then(/^I should see Sign in page with email\/password fields$/) do
  heading=$driver.find_element(:class, "header__content__heading").text()
  if(heading=="Sign in")
    puts("Sign in page is launched")
  else
    puts("Sign in page is Not launched")
  end
end

Given(/^I am on Sign in page$/) do
  $driver.get "https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin"
end

When(/^I enter (.*) and (.*)$/) do |emailorphone, password|
  email=$driver.find_element(:id , "username")
  pass=$driver.find_element(:id , 'password')
  email.send_keys(emailorphone)
  pass.send_keys(password)
end

And(/^click on sign in button$/) do
  $driver.find_element(:class, "login__form_action_container").click()
end

Then(/^I should be able to Sign in$/) do
  current_url=$driver.current_url
  successfull_signin_url ="https://www.linkedin.com/feed/?trk=guest_homepage-basic_nav-header-signin"
  if(current_url==successfull_signin_url)
    puts("User signed in to LinkedIn successfully")
  else
    puts("Enter correct email/phone and password details to sign in ")
  end
end