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
    
    Given that a comic was selected
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

# Project Information
## Targets
This project is splitted into 4 targets

### `BDDComicsList` target
Default application target.

### `BDDComicsListiOSTests` target
This target runs tests that are related to views.

### `BDDComicsListMacOSTests` target
This target runs tests that are not related to views.

The macOS test target builds and run way faster because it does not rely on some frameworks such as `UIKit`, and also, it will NOT launch the app in the simulator. This is very useful to run tests much quicker than the iOS Tests target.

### `BDDComicsListUITests` target.
This target runs UI tests. Those tests are interaction tests with the UI.

## Dependency manager
This project uses [Cocoapods](https://cocoapods.org/) to manage dependencies.

Libraries used in this project:
- [Quick](https://cocoapods.org/pods/Quick): Quick is a behavior-driven development framework for Swift and Objective-C
- [Nimble](https://cocoapods.org/pods/Nimble): Nimble is used to express the expected outcomes of Swift or Objective-C expressions. Inspired by Cedar. 
- [iOSSnapshotTestCase](https://cocoapods.org/pods/iOSSnapshotTestCase): A "snapshot test case" takes a configured UIView or CALayer and uses the renderInContext: method to get an image snapshot of its contents. It compares this snapshot to a "reference image" stored in your source code repository and fails the test if the two images don't match.

## App Code Architecture
Clean Architecture, similar to [VIPER](https://www.objc.io/issues/13-architecture/viper/) like.

These are the main components:
- `Connector`: Connect dependencies to the module.
- `Router`: Coordinates the navigation logic.
- `ViewController`: `UIViewController` subclass that displays the content on the screen.
- `Presenter`: Contains view logic for preparing content for display and for reacting to user inputs.
- `Interactor`: Contains the business logic as specified by a use case.
- `DataGateway`: Provides data/models to the interactor. This is bridges any data repository (remote, database..) to the interactor.
- `RemoteData`: Fetches data from a remote server.

## Integration Tests
There are two Integration Test files: One for the comics list and the other for the comic character list. Those tests reflect and assert the acceptance critera of the User Stories mentioned above in this document.

File names:
- `CharactersListModuleSpecs.swift`
-  `ComicsListModuleSpecs.swift` 

## Scheme Launch Arguments
The `BDDComicsList` scheme passes an argument named `UseMockData` when running **tests**. Also, when the UI tests create a `XCUIApplication`, it passes the same argument as a launch argument.

The `UseMockData` is being used to check if the app should use mock data. In the `Connector` layer, it checkes for this argument to see whether it should use mock data or not.
