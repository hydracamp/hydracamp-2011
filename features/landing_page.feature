Feature: Creating Tweets

In order to read tweets and add my own
As a zombie
I want to see a list of everyone's tweets and a way to create new tweets


Scenario: Creating tweets when logged in as a zombie
  Given I am logged in as a zombie named "Slimer"
  When I visit the home page
  Then I should see "Welcome Slimer"
  And I should see a form for creating new tweets
  And I should see a list of everyone's tweets
  When I enter a status of "I am slimer!"
  And I press "tweet."
  Then I should be on the home page
  And I should see "I am slimer!" in the list of tweets 
  
Scenario: Visiting landing page when not logged in
  Given I am not logged in
  When I visit the home page
  Then I should see "log in"
  And I should not see a form for creating new tweets