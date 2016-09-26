Feature: Salesforce add account 1

  Scenario: Sign in, add and delete a new account, and sign out
#    Given I run with Watir
    Given I open Internet Explorer
#    Given I open Chrome
    And sleep for 3 seconds
    Then I go to the Salesforce URL
    And sleep for 1 seconds
    Then I click the Login button
    And sleep for 5 seconds
    And I should see "Log in to Salesforce"

    Then I enter "patrick@3qilabs.com" in user name
    And I enter "b0nb0nb0n" in text field with "id" "password"
    And I click the button with "text" "Log in to Salesforce"
    And sleep for 2 seconds

    Then I click the link with "text" "Accounts"
    And sleep for 2 seconds

    Then I click the button with "title" "New"
    And sleep for 2 seconds
    And I fill in field labeled "Account Name" with "ARBOR Accounting"
    And I click the button with "title" "Save"
    And sleep for 2 seconds
    And I should see "Account Detail"

    Then I check that the div with id "acc2_ileinner" contains "ARBOR Accounting"
    And sleep for 1 seconds
    Then I click the link with "text" "Accounts"
    And sleep for 2 seconds
    And I should see "ARBOR Accounting"
    And sleep for 2 seconds

    Then I click on "ARBOR Accounting"
    And sleep for 2 seconds
    And I click the account delete button
    And sleep for 1 seconds
    Then I click "OK" in the browser alert
    And sleep for 1 seconds
    And I should not see "ARBOR Accounting"

    Then I sign out
    And sleep for 1 second
    And I should see "Log in to Salesforce"
    And I close the browser
