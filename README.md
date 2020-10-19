# NavigationMenuApp
NavigationMenuApp pulls the data from API when the app starts.
It expand or hide the sub menus from the category based on the user selection.
It has down arrow which contains sub menus and right arrow has no sub menus.

### Description 
This project uses MVC design pattern for the architecture of the app.
It uses the TableViewController as 'ViewController.swift" to display the data dynamically.
It contains all model structs based on the json response from the api.

### Build and Runtime Requirements 
- Xcode 11.0 or later
- iOS 13.0 or later
- macOS 10.15 or later
- Swift Version 5

### API References and libraries used
Implementation of API network request is handled by Alamofire framework.
Decoded the json using swift decoder. 

### Usage
- For software dependencies using CocoaPods:
  Run the podfile using 'pod install' in your terminal to integrate the required frameworks.
- Please use .xcworkspace file to build and run the project.
