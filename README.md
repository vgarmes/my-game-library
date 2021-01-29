# MY GAME LIBRARY

This is my personal web app for keeping track of my videogame collection as well as logging the videogames I am completing.

The web app is deployed to production in the following link:
https://juegos-victor.herokuapp.com/

Guest users have only limited view access.

The app has the following features

* User authentication with Devise

* PostgreSQL as database engine

* Bulma CSS framework

* Cloud image storage with Active Storage and Cloudinary

* Screen size responsive

* UI/UX features in Javascript like an interactive star rating widget and a floating button to add new videogames

## Getting Started

To get a local copy up and running follow these steps.

 - Clone this repository to your local machine using ```git clone git@github.com:vgarmes/my-game-library.git```.

 - Go into the app local directory.
 
 - Run ```bundle install``` to install dependencies.
 
 - Run ```rails db:migrate``` to migrate the database.

 - Run ```rails s``` to run the server.
