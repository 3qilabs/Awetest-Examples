require 'rubygems'
#require 'watir'
#require 'watir-webdriver'

#browser = Watir::Browser.new
browser = Watir::Browser.new :ie
#browser = Watir::Browser.new :chrome, :service_log_path => 'add_account_chrome.log'
browser.goto("www.salesforce.com")
#sleep 3
browser.link(:id, 'button-login').when_present.click
#browser.link(:id, 'button-login').when_present.fire_event('onclick')
sleep 6
puts browser.text.include?('Log in to Salesforce')
browser.text_field(:id, 'username').when_present.set('patrick@3qilabs.com')
browser.text_field(:id, 'password').when_present.set('b0nb0nb0n')
browser.button(:text, 'Log in to Salesforce').when_present.click
#sleep 2
browser.link(:text, 'Accounts').when_present.click
#sleep 2
browser.button(:title, 'New').when_present.click
sleep 2
for_id = browser.label(:text, /Account Name/).for
#for_id = browser.label(:text, /Account Name/).attribute_value("for")
puts "#{for_id}"
browser.text_field(:id, for_id).set('ACME Accounting')
browser.button(:title, 'Save').click
sleep 2
puts browser.text.include?('Account Detail')
puts browser.div(:id, 'acc2_ileinner').text.include?('ACME Accounting')
sleep 1
browser.link(:text, 'Accounts').click
sleep 2
puts browser.text.include?('ACME Accounting')
sleep 2
browser.link(:text, 'ACME Accounting').fire_event('onclick')
sleep 2
browser.button(:title, 'Delete').click
sleep 1
browser.alert.ok
sleep 1
puts browser.text.include?('ACME Accounting')
browser.div(:id, 'userNavButton').click
browser.link(:title, 'Logout').click
sleep 1
puts browser.text.include?('Log in to Salesforce')
sleep 1
browser.close
