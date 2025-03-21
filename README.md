# Project Overview
This project has been developed using SwiftUI with the MVVM architecture and employs the Repository pattern for efficient data management and separation of concerns. It takes full advantage of the latest Swift feature for structural concurrency, utilizing async/await for API calls to ensure a clean and scalable asynchronous programming model.

The application consists of two main screens:

ArticleView: Displays a list of articles.
ArticleDetailView: Provides detailed information about a selected article.
This project demonstrates modern Swift development practices while maintaining a clean, modular, and maintainable codebase.

# External Dependecy Requirement
As the app is developed entirely using native technologies without relying on third-party libraries, there are no external dependencies required to run the application. Upon launch, the app loads with default selections, displaying the Most Viewed Articles for a duration of one week.


# Key Features
## MVVM Design Pattern
The MVVM (Model-View-ViewModel) design pattern has been implemented to ensure the application is both testable and scalable, promoting separation of concerns and improving maintainability.

## SwiftUI with Async/Await
The app utilizes the latest tools and technologies, including SwiftUI for UI development and Async/Await for handling asynchronous tasks, ensuring a modern and efficient architecture.

## Repository Design Pattern
The Repository pattern is used to decouple the ViewModel from the data layer, providing a clean and modular architecture for data management and access.

## Dark Mode Support
The application fully supports Dark Mode, ensuring a seamless user experience across light and dark system appearances.

## Mocks for Testing
Mock data is used to effectively test various business logic components in isolation, improving the reliability of unit tests.

## Image Caching
An efficient image caching mechanism is implemented to improve performance and provide a responsive user experience by reducing unnecessary network requests.

## Unit Testing
Comprehensive unit tests are implemented across all business logic layers, ensuring robustness and reliability of the app.

## This Demo App Running
1. Register as a developer at https://developer.nytimes.com
2. Create and register your application
3. Obtain your unique API key
4. Configure that API_Key inside the info.plist file of the project and run.
