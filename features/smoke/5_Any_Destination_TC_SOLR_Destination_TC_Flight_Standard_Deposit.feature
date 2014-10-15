Feature: Any Destination TC SOLR Destination TC Flight Standard Deposit

  @javascript
  Scenario: End to end for SOLR with Standard Deposit
    Given I am on home page
    When I search for SOLR package to Turkey from London
    Then I should get SOLR packages in search results
    When I select first SOLR package
    Then I should get the details of the package
    When I go for the booking of selected package
    And I select the extras which I want to be included in my package
    And I enter details of all the passengers
    And I enter card details to make payment
    And I make the payment after accepting terms and conditions
    Then My Package should get booked successfully