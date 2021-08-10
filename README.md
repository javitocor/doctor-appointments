# README
<!--
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to c<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url] 
[![Forks][forks-shield]][forks-url] 
[![Stargazers][stars-shield]][stars-url] 
[![Issues][issues-shield]][issues-url] 
![Hireable](https://cdn.rawgit.com/hiendv/hireable/master/styles/default/yes.svg) 

# Doctor Appointments App

>  A web app that allows the user sign up or log in as a patient and book appointments with a doctor. The app is based in 3 models, User, Role and Appointments. Only an Admin user can create Doctor users, by default users sign up as patients. To book an appointment the patient must send 3 photos to the Doctor to create a 3d image. Built with Ruby on Rails.

Additional description about the project and its features.

## Built With

- HTML 
- CSS
- BOOTSTRAP
- RUBY v2.6.5
- RUBY ON RAILS v5.2.4
- DEVISE
- CANCANCAN
- CARRIERWAVE
- GITHUB ACTIONS
- VSCODE
- GEMS USED FOR TESTING:
  - CAPYBARA
  - SELENIUM WEBDRIVER
  - CHROMEDRIVER HELPER
  - DATABASE CLEANER
  - RSPEC-RAILS
  - SHOULDA-MATCHERS

## Getting Started

### Usage
To have this app on your pc, you need to:
* [download](https://github.com/javitocor/doctor-appointments/archive/development.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:javitocor/doctor-appointments.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/javitocor/doctor-appointments.git
  ```

* In the project directory, you can run:

Install gems with:

``` bash
bundle install
```
Setup database with:

``` bash
   rails db:migrate
```

Populate Database with:

``` bash
   rails db:seed
   Log in with email: 'kev@example.com', and password:'aaaaaaaa' to log in as Patient
   Log in with email: 'sally@example.com', and password:'aaaaaaaa' to log in as Doctor
   Log in with email: 'jack@example.com', and password:'aaaaaaaa' to log in as Admin
```
Access the page by typing in your web browser

``` bash
   http://localhost:3000/
```

## Future Features
- Add user locations.
- Add extra UI.
- Add statistics.
- Add JSON feature

## Author

👤 Javier Oriol Correas Sanchez Cuesta 
- Github: [@javitocor](https://github.com/javitocor) 
- Twitter: [@JavierCorreas4](https://twitter.com/JavierCorreas4) 
- Linkedin: [Javier Oriol Correas Sanchez Cuesta](https://www.linkedin.com/in/javier-correas-sanchez-cuesta-15289482/) 

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/javitocor/doctor-appointments/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments 🚀

- [Rails documentation](https://guides.rubyonrails.org/)

## 📝 License

This project is [MIT](lic.url) licensed.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/javitocor/doctor-appointments.svg?style=flat-square
[contributors-url]: https://github.com/javitocor/doctor-appointments/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/javitocor/doctor-appointments.svg?style=flat-square
[forks-url]: https://github.com/javitocor/doctor-appointments/network/members
[stars-shield]: https://img.shields.io/github/stars/javitocor/doctor-appointments.svg?style=flat-square
[stars-url]: https://github.com/javitocor/doctor-appointments/stargazers
[issues-shield]: https://img.shields.io/github/issues/javitocor/doctor-appointments.svg?style=flat-square
[issues-url]: https://github.com/javitocor/doctor-appointments/issuesover:


