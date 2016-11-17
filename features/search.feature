Feature: Sprinter Nature Task 1 Minimal set of automation tests to validate the search functionality for the happy and unhappy path

  @happy
  Scenario Outline: Happy Path Search
    Given I am on the home page
    When I click on the search field
      And I enter <search_text> into the search field
      And I click on the search button
    Then I should be on the search page
    And I should see the expected total results and number of results on the page for <search_text>
    # The expected results should be coming from a call to the search API for each site - they should not be hardcoded as they are here
    Examples:
    | search_text                     |
    #single word
    | nature                          |
    #phrase
    | \"rock and roll was in a slump\"|
    #non-english
    | Αθήνα                           |


  @unhappy
  Scenario Outline: Negative Test
    Given I am on the home page
    When I click on the search field
      And I enter <search_text> into the search field
      And I click on the search button
    Then I should be on the search page
      And I should see the expected total results and number of results on the page for <search_text>
      And I should see a message containing "Sorry" notifying me there are no results
    Examples:
      | search_text  |
      #longest word to appear in literature: https://en.wikipedia.org/wiki/Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphioparaomelitokatakechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon
      | Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphioparaomelitokatakechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon |




