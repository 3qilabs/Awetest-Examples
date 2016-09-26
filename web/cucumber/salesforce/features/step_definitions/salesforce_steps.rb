def open_chrome
  setup_watir_webdriver
  @browser = Watir::Browser.new :chrome, :service_log_path => 'chromedriver.out'
end

Then /^I go to the Salesforce URL$/ do
  @browser.goto("www.salesforce.com")
end

Then /^I click the Login button$/ do
  @browser.link(:id, 'button-login').click
end

Then /^I enter "(.*?)" in user name$/ do |userid|
  step "I enter \"#{userid}\" in text field with id \"username\""
end

And /^I enter "(.*?)" in password$/ do |password|
  step "I enter \"#{password}\" in text field with name \"password\""
end

Then /^I fill in field labeled "(.*?)" with "(.*?)"$/ do |field, value| # assumes a label element and its associated element has id
  if $watir_script
    associated_label = @browser.label(:text, /#{field}/).for
  else
    associated_label = @browser.label(:text, /#{field}/).attribute_value("for")
  end
  #associated_label = @browser.element(:xpath, '//label[contains(text(),"#{arg1}")]').attribute_value("for"))
  @browser.text_field(:id, associated_label).set value
end

Then /^I fire event "(.*?)" on the link with "(.*?)" "(.*?)"$/ do |event, how, what|
  @browser.link(how.to_sym, what).when_present.fire_event(event)
end

Then /^I click on "(.*?)"$/ do |what|
  if $watir_script
    @browser.link(:text, what).click
  else
    @browser.link(:text, what).fire_event('onclick')
  end
end

Then /^I click the account delete button$/ do
  if $watir_script
    @browser.button(:title, 'Delete').click_no_wait
  else
    @browser.button(:title, 'Delete').fire_event('onclick')
  end
end


#Then /^I create a unique account name$/ do
#  @account_name = "Acct #{$timestamp}"
#end
#
#And /^I enter the account name in the new account field$/ do
#  sleep(2)
#  step "I enter \"#{@account_name}\" in text field with name \"Account Name\""
#end
#
#Then /^I check that account name contains the account name$/ do
#  step "I check that the span with id \"value_Account Name\" contains \"#{@account_name}\""
#end
#
#And /^I should see the account name$/ do
#  step "I should see \"#{@account_name}\""
#end
#
#And /^I should not see the account name$/ do
#  step "I should not see \"#{@account_name}\""
#end
#
#Then /^I click the link with the account name$/ do
#  step "I click the link with \"text\" \"#{@account_name}\""
#end
#
Then /^I sign out$/ do
  step "I click the div with \"id\" \"userNavButton\""
  step "I click the link with \"title\" \"Logout\""
end

#Then /^I check that the span with "?(.+?)"? "(.*?)" contains the account name$/ do |how, what|
#  what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
#  #step "I wait until span with #{how} \"#{what}\" is ready"
#  @browser.span(how.to_sym, what).text == @account_name
#end

# NOTE: This step definition is a candidate for predefined steps
And /^sleep for "?(\d+?)"? seconds?$/ do |seconds|
  step "I wait #{seconds} seconds"
end

# NOTE: This step definition is a candidate for predefined steps
And /^I wait for the browser to load$/ do
  @browser.wait
end

