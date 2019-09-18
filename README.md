# Behaviour Driven Development Comics List App

# About
This app was developed to demonstrate the process of creating an iOS app using BDD techniques.

# Product Specs

## Initiative

Create an app that shows a list of Marvel comics and their characters so we can inform people who are not aware of Marvel stories.

## User Stories

### US01 - See a list of Marvel Comics
    As a user
    I want to see a list of Marvel Comics grouped by the first letter of the comic's title when I open the app
    So I can get to know the comics they have

#### Acceptance criteria:

*Scenario: No internet connection:*

    Given that I don't have internet connection
    When I open the app
    Then present a message informing that it can not present the list of comics

*Scenario: Internet connection OK, response fails:*

    Given that I have internet connection
    When the server response is invalid
    Then present an error message informing that the content couldn't be read

*Scenario: Internet connection OK, response succeed:*

    Given that I have internet connection
    When the server response is valid
    Then present a list of Marvel Comics titles grouped by the first letter of the comic's title

### US02 - See the list of characters of a given comic
    As a user
    I want to see the list of characters when I tap on a comic title
    So I can have more information about the comic

#### Acceptance criteria:

*Scenario: List of comics is presented:*

    Given that the list of comics has one or more items
    When I tap on a comic
    Then present a list with the name of the characters of that comic

### US03 - Loading comics UI indicator
    As a user
    I want to see a UI element indicating that the app is loading comics
    So I know the data will be refreshed with new information

#### Acceptance criteria:

*Scenario: Device does not have internet connection:*

    Given that I don't have internet connection
    When it tries to load comics
    Then do not present a UI activity indicator

*Scenario: Device has internet connection and app is loading comics:*

    Given that I have internet connection
    When it is loading comics
    Then present a UI activity indicator

*Scenario: Device has internet connection and app finished loading comics:*

    Given that I have internet connection
    When it finished loading comics
    Then hide the UI activity indicator

### US04 - Loading comic characters UI indicator
    As a user
    I want to see a UI element indicating that the app is loading the comic characters
    So I know the data will be refreshed with new information

#### Acceptance criteria:

*Scenario: Device does not have internet connection:*

    Given that I don't have internet connection
    When it tries to load comic characters
    Then do not present a UI activity indicator

*Scenario: Device has internet connection and app is loading comic characters:*

    Given that I have internet connection
    When the app is loading the comic characters
    Then present a UI activity indicator

*Scenario: Device has internet connection and app finished loading comic characters:*

    Given that I have internet connection
    When the app finished loading the comic characters
    Then hide the UI activity indicator

# Development steps

## 1. Create new targets for testing

When this project was created, the `Include Unit Tests` and `Include UI Tests` checkboxes weren't marked for educational purpose. We will do this manually here and will include an extra macOS test target that will help us speed up writing tests. 

**The macOS test target builds and run way faster because it does not rely on some frameworks such as `UIKit`, and because of that, every time tests run it will not have to compile resources like `xib` files neither will launch the app in the simulator. I found this very useful to speed up the development process because when using BDD techniques you should write tests before anything else, so if you are not writing code that is not related to views, you can run it in the macOS target.**

### `BDDComicsListiOSTests` target
In Xcode, go to `File` -> `New target`. Select `iOS` in the top bar and select `iOS Unit Testing Bundle`. The `BDDComicsListiOSTests` name was given to this specific target. Note the `iOS` word within the target title: This is very important because it differentiates the iOS to the macOS test targets.

This target is used to write unit tests that are related to views.

### `BDDComicsListMacOSTests` target
In Xcode, go to `File` -> `New target`. Select `macOS` in the top bar and select `macOS Unit Testing Bundle`. The `BDDComicsListMacOSTests` name was given to this specific target. Note the `MacOS` word within the target title: This is very important because it differentiates the iOS to the macOS test targets.

This target is used to write unit tests that are not related to views.

### `BDDComicsListUITests` target.
In Xcode, go to `File` -> `New target`. Select `iOS` in the top bar and select `iOS UI Testing Bundle`. The `BDDComicsListUITests` name was given to this specific target.

This target is used to run UI tests.

## 2. Setup Cocoapods

The Cocoapods is used in this project to manage dependency manager. 

Main libraries used in this project:
- Quick: Quick is a behavior-driven development framework for Swift and Objective-C
- Nimble: Nimble is used to express the expected outcomes of Swift or Objective-C expressions. Inspired by Cedar. 

## 3. Defining app code architecture

Clean architecture VIPER like

## 4. Writing tests

1. Start with the interactor. Create BDD tests for the interactor, and then unit tests for related classes if needed
  a) Adding test case placeholders for the comics list: 1547302bd81b38362bb57453bd563944b5687f0a
  b) adding first test cases placeholders for the characters list: e2059324c7fb56f37782f5edc736d2f890a390aa
  c) Create interactor class with business logic first and implement the tests
  
2. Create viewcontroller and views/snapshot tests

## 5. UI Tests
Once UI is done, do UI tests
