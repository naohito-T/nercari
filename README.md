# Nercari


* Ruby version
3.1.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## How to

<details>
<summary>Show Start instructions</summary>

- Env decrypt.  
`$ bundle exec thor credentials:decrypt`

- Build docker image  
`$ docker-compose build`
  - Short syntax  
  `$ make build`

- Install bundle in docker image  
`$ docker-compose run --rm app bundle install`  
  - Short syntax  
  `$ make bundle`

- Create DB.  
`$ docker-compose run --rm app bundle exec rails db:create`

- Start Docker or Host
  - Docker  
  `$ docker-compose up`
  - Host pc.  
  `$ rails s`
</details>
