require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'nokogiri'



Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.default_selector = :css