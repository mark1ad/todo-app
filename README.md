# The Get Stuff Done App

A simple ToDo app developed with Ruby on Rails in a Docker container. [Semaphore](https://semaphoreci.com/) is used for CI/CD.

[Get Stuff Done](https://marks-to-do.herokuapp.com)

## Technologies Used

* Ruby on Rails
* [Docker](https://www.docker.com/)
* [Bootstrap](http://getbootstrap.com/)
* [RSpec](http://rspec.info/)

## Setting Up Development Environment

Once you have Docker installed clone the repository. Then run
```
docker-compose build
docker-compose up
```
This will get your Docker container running. In a new terminal run
```
docker-compose run web rails db:create
```
Now you can open ```localhost:3001``` in your browser.

If you make changes to the GemFile run
```
docker-compose run web bundle install
docker-compose up --build
```

## Testing

Tests have been written in both Minitest and RSpec. Run the tests with
```
docker-compose run web rails test
docker-compose run web bundle exec rspec
```

## Future Enhancements

My motivation for this project was to learn how to use Docker and how to set up CI/CD so the app was intentionally kept simple. Some possible enhancements include:
* User accounts
* To Do details like due date, description, and priority.
* Catagories for grouping To Dos.
