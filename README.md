# README

#### Docker

This project has docker / compose support. You can run the following command to start the project:

```bash
docker compose up -d
```

or if you prefer to execute the web server manually:

```bash
docker compose run --rm --service-ports web bash
```

- Exec the container as root:

```bash
docker-compose run -u root--rm --service-ports web bash 
```

#### Technology Stack

- Ruby 3.3
- Rails 8.0

#### Gems installed for the challenge:

- rspec
- image_processing (for active storage)

#### Comments

- I am using the new rails 8 way of doing things, I only added the app to the compose. After running the app you can change the RAILS_ENV or stay with the production environment.
- I disabled the force_ssl to avoid the redirection to https. To make it work I would need to configure nginx to handle the request and I think it is not necessary for this challenge.
- The project is running with PRODUCTION VARIABLE (if you are using docker), remember to run bundle exec rails assets:precompile && rails s -b 0.0.0.0
- The project is on my github: https://github.com/diogobest/properties_challenge
