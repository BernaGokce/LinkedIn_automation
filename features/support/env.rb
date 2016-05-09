require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'nokogiri'
require 'rest-client'



Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10