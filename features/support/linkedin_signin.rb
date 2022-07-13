class Sign_in

  def linkedin_url
    $driver.get "https://www.linkedin.com"
  end

  def sign_in_button
    $driver.find_element(:class , "nav__button-secondary").click()
  end

  def sign_in_page_heading
    header = $driver.find_element(:class , "header__content__heading").text()
    if(header=="Sign in")
      message = "Sign in page is launched"
    else
      message = "Sign in page is Not launched"
    end
    return message
  end

  def sign_in_page
    $driver.get "https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin"
  end

  def credentials (email_id ,password)
    @email=$driver.find_element(:id , "username")
    pass=$driver.find_element(:id , 'password')
    @email.send_keys(email_id)
    pass.send_keys(password)
  end

  def login_button
    $driver.find_element(:class, "login__form_action_container").click()
  end

  def sign_in_status
    current_url=$driver.current_url
    successful_signin_url ="https://www.linkedin.com/feed/?trk=guest_homepage-basic_nav-header-signin"
    if(current_url==successful_signin_url)
      print ' successful'
    else
      fail "Enter correct details and Try again "
    end
  end
end