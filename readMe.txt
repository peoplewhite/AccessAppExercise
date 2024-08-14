# GitHub Users App

This iOS app displays a list of GitHub users using the GitHub API. It follows the MVVM (Model-View-ViewModel) architecture pattern.

## Architecture

### Model (M)
- GitHubUser.swift
  - Model file for representing a GitHub user profile
  - Contains minimum 3 properties for this exercise
  - Uses SwiftyJSON library to convert JSON to model instances

### View (V)
- GitHubUserListCell.swift
  - Swift file for the cell UI setup and data binding
- GitHubUsersListView.swift
  - SwiftUI view for displaying the list of GitHub users

### ViewModel (VM)
- GitHubUsersListViewModel.swift
  - Responsible for fetching all users from the GitHub API
  - Stores fetched users in the "users" property
  - Uses closures to notify the view when data is updated

### Other Components
- APIManager.swift
  - Handles API requests and responses

## Dependencies
- Alamofire: HTTP networking library
- Moya: Network abstraction layer
- SwiftyJSON: JSON parsing
- PKHUD: Progress HUD
- DynamicColor: Color manipulation
- SDWebImageSwiftUI: Asynchronous image loading and caching

## Minimum iOS Version
iOS 13.0