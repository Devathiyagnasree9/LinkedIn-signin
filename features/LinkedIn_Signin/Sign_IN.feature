Feature: verify Sign in to LinkedIn website
  Checking either able to sign in to LinkedIn web page or not

  Scenario: Verify navigation to sign in page
    Given I am on welcome home page
    When I click on sign in button
    Then I should see Sign in page with email/password fields

  Scenario Outline: Verify Sign in to LinkedIn
    Given I am on Sign in page
    When I enter <email_address/phone> and <password>
    And click on sign in button
    Then I should be able to Sign in

    Examples:
      |email_address/phone||password|
      |Abcd123@gmail.com||abcd@123|
      |devathiyagnasreetest@gmail.com||Abcd@123|
      |devathiyagnasreetest@gmail.com||Test@123|
      |9023123456||Abcd@123|