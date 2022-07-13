require "rubygems"
require "selenium-webdriver"
require "report_builder"



Before do |scenario|
  Selenium::WebDriver::Chrome.driver_path="/home/global/Downloads/usr/bin/chromedriver"
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.window.maximize()
end

After do |scenario|
  if scenario.failed?
    encoded_img = $driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
  end
  sleep(2)
  $driver.close
end

at_exit do
ReportBuilder.configure do |config|
  config.input_path = "results/jsonfile.json"
  config.report_types = [:html]
  config.report_title = 'My Test Results'
  config.include_images = true
end
ReportBuilder.build_report
end