# Behaviour Driven Development Comics List App

# About
This app was developed to demonstrate the process of creating an iOS app using BDD techniques.

# Product Specs

## Initiative

Create an app that shows a list of Marvel comics and their characters so we can inform people who are not aware of Marvel stories.

## User Stories

### US01 - See a list of Marvel Comics
    As a user
    I want to see a list of Marvel Comics grouped and sorted ascending by the first letter of the comic's title when I open the app
    So I can get to know the comics they have

#### Acceptance criteria:

*Scenario - No internet connection:*

    Given that I don't have internet connection
    When it tries to load comics
    Then present a message informing that there is no internet connection

*Scenario - Internet connection OK and response is invalid:*

    Given that I have internet connection
    When the server response is invalid
    Then present an error message informing that the content couldn't be read

*Scenario - Internet connection OK and response is valid:*

    Given that I have internet connection
    When the server response is valid
    Then present a list of Marvel Comics titles grouped and sorted ascending by the first letter of the comic's title

### US02 - See the list of characters of a given comic
    As a user
    I want to see the list of characters sorted ascending by the first letter when I tap on a comic title
    So I can have more information about the comic

#### Acceptance criteria:

*Scenario - No internet connection:*

    Given that I don't have internet connection
    And the list of comics has one or more items
    When I tap on a comic title
    Then present a message informing that there is no internet connection

*Scenario - Internet connection OK and response is invalid:*

    Given that I have internet connection
    And the list of comics has one or more items
    When I tapped on a comic title
    And the response is invalid
    Then present a message informing that it can not present the list of characters

*Scenario - Internet connection OK and response is valid:*

    Given that I have internet connection
    And the list of comics has one or more items
    When I tapped on a comic title
    And the response is valid
    Then present a list with the name of the characters of that comic sorted ascending by the first letter

### US03 - Present comic name in the title of the characters view
    As a user
    I want to see the name of the comic as a title in the characters view
    So I know to which comic the characters belong to

#### Acceptance criteria:

*Scenario - Is presenting a list of comics characters:*
    
    Given that a list of comics characters was successfully loaded
    When the view with the list of comic characters is presented
    Then show the name of the comic as the view's title

### US04 - Loading comics UI indicator
    As a user
    I want to see a UI element indicating that the app is loading comics
    So I know the data will be refreshed with new information

#### Acceptance criteria:

*Scenario - App is loading comics:*

    Given that I opened the app
    When it is loading comics
    Then present a UI activity indicator

*Scenario - App finished loading comics:*

    Given that I opened the app
    When it finished loading comics
    Then hide the UI activity indicator

### US05 - Loading comic characters UI indicator
    As a user
    I want to see a UI element indicating that the app is loading the comic characters
    So I know the data will be refreshed with new information

#### Acceptance criteria:

*Scenario - App is loading comic characters:*

    Given that I selected one comic
    When the app is loading the comic characters
    Then present a UI activity indicator

*Scenario - App finished loading comic characters:*

    Given that I selected one comic
    When the app finished loading the comic characters
    Then hide the UI activity indicator

# Development steps

## 1. Create Xcode Project

## 2. Create new targets for testing

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

## 3. Setup Cocoapods

The Cocoapods is used in this project to manage dependency manager. 

Main libraries used in this project:
- Quick: Quick is a behavior-driven development framework for Swift and Objective-C
- Nimble: Nimble is used to express the expected outcomes of Swift or Objective-C expressions. Inspired by Cedar. 

## 4. Defining app code architecture

Clean architecture VIPER like

## 5. Writing tests

When wirting tests we don't write any view (i.e. UIKit dependent classes). This is just testing the logic behind it.

1. Start with the interactor. Create BDD tests for the interactor, and then unit tests for related classes if needed (another option is to start creating the views first, and then create the interactor...)
    a) Adding test case placeholders for the comics list: 9ac95be00f02e4010f0c9b22a9663df16194a67f
    b) Create interactor class with business logic first and implement the tests
    c) Remember  to add files to macos test target
    d) Add unit test to ComicsGrouper: 656db1087533d97a570dc043f069e1bc655c0f2a
    e) Testing if comics interactor will present the characters view when the comic is selected: 48298dd226ccfb16aa9e979ec2e7e6c54db54730 and d5178720289c4bc5a720df068334d7446bc77371
    f) Creating tests for the ComicsList Presenter: 8758e22fb94f2ad50d09b760b6a989a94dc2e7ec
    g) !! Fiest write the test cases (description, context, it) -> This gives you an idea of the behaviour you want
    h) It is okay that user stories change along the development: The developer should never guess, if you realize that something is missing, add first in the user stories before implement it.
    i) Write your code based on behaviour
    j) Write unit tests if needed, but in a BDD style: 2c14ab14de5267bda9a6198871db1bbbc371a329
    k) Write viewcontroller and custom list table view cell tests in iOSTests target - it has access to uikit
    l) You do not write any code in the application without a test - you need to justify why you are writing any line
    m) Added snapshot tests to custom list table view cell: 857ba0b77993084c70687f0bb626a86cc4d3936e
    o) Added snapshot tests to comicslistviewcontroller: ee5112a790cbfb7f48ae41be0b3f9df57c364159
    p) Unit testing characterslistviewmodel based on behaviour: (02ae0ff5c508802862e03473d6d706ced2ac6174)
    q) Started writing tests for characterslistviewcontroller: d66fe9cc3306455c1724a24d885e44ff12db10a4
    
2. Create viewcontroller and views/snapshot tests

## 6. UI Tests
Once UI is done, do UI tests

## 7. Automate tests

# General

## No reachability
For now, no 
