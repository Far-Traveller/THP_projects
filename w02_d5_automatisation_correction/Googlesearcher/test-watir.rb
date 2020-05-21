require 'watir'
require 'webdrivers/geckodriver'

#args: ['--no-sandbox', '--privileged']

Selenium::WebDriver::Firefox.path = '/usr/bin/geckodriver'
browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'