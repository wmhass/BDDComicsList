# Behaviour Driven Development Comics List App

## About
This app was developed to demonstrate the process of creating an iOS app using BDD techiques

## Specs

### Product Initiative

Create an app that shows a list of Marvel comics and their characters so we can inform people that are not aware of Marvel stories.

### User Stories

#### US01 - See a list of Marvel Comics
As a user
I want to see a list of Marvel Comics
So I can get to know their titles

**Acceptance criteria:***

*Scenario:* No internet connection:
    Given that I don't have internet connection
    Then present a message informing that it can not present the list of Comics

*Scenario:* Internet connection OK, response fails:
    Given that I have internet connection
    And the server response is wrong
    Then present an error message informing that the content couldn't be read

*Scenario:* Internet connection OK, response succeed:
    Given that I have internet connection
    And the server response is correct
    Then present a list of Marvel Comics

#### US02 - See the list of Marvel Comics grouped by first letter
As a user
I want to see a list of Marvel Comics sectioned/grouped by the first letter of the comic's title
So it is easier to scroll through the content and find a specific comic

**Acceptance criteria:***

*Scenario:* Internet connection and response OK:
    Given that I have internet connection
    And the server response is correct
    Then present a list of Marvel Comics grouped by the first letter of the comic's title