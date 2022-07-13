require "rubygems"
require "selenium-webdriver"
require 'thread'

Before do |scenario|
  Selenium::WebDriver::Chrome.driver_path="/home/global/Desktop/Ruby/chromedriver_linux64/chromedriver"
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.window.maximize()
end

After do |scenario|
  sleep(2)
  $driver.close
end