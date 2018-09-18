
A showcase iOS app demonstrates an alternative implementation using the MVVM-C architecture

# What you need
Before exploring this showcase project, you should familiarise yourself with the following topics:

* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxAction](https://github.com/RxSwiftCommunity/Action)
* [RxFlow](https://github.com/RxSwiftCommunity/RxFlow)
* [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/)

# Features:
* Authentication
  * username and password based authentication (all mocked to simplify the implementation)
  * the authenticate button is only enabled after user enters valid credential
  * user can skip the authentication and go to home screen directly
* Home screen 
  * show a list of articles
  * one column on portait
  * two columns on landscape
* Article detail
  * show the article detail

# Goals:
* Show an alternative implementation using the MVVM-C architecture
* Show the best practice on how to write Unit tests and UI test with RxSwift, RxFlow
* Have 100% code coverage for the ViewModels which manage all the business logic

# Notes:
The main purpose of the app is to show how to implement the MVVM-C design pattern, no intention to build a real app, so the project uses few mocked services to simplify the implementation
