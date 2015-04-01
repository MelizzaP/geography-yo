Spartz Coding Challenge
=======================

A simple REST API.  Spartz sent a set of sample data in `cities.csv` and `users.csv`(located in the db directory). The instructions were to implement a few basic operations on the data provided, including listing the cities in a given state, listing cities near another city, and registering a visit to a particular city by a user.  I've built a very basic rails application complete the exercise.  

---

## Deliverables

- The source code for your solution.
- The database schema you use to implement your solution.
- Any additional documentation you feel is necessary to explain how your application works, or describe your thought process and design decisions.

## Things To Consider

- How to deal with bad requests
- Requests that could result in large data sets

### Technologies Used
  * Server-side: Ruby on Rails, PostgreSQL
  * Testing: Rspec

### Installation
Run the following commands in your terminal
```
  git clone git@github.com:MelizzaP/geography-yo.git geography_yo
  cd geography_yo
  bundle install
```
Create a database by running
```
  bundle exec rake db:create db:migrate db:seed
```
  
Run locally(localhost:3000)
```
  rails server
```
  
Run test suite
```
  bundle exec rspec
```
---
Endpoints
---------
| HTTP Verb | Path                                                   | Function                                                                             |
| :-------- |:-------------------------------------------------------| :------------------------------------------------------------------------------------|
| GET       | /v1/states/{state}/cities                              | List all cities in a state                                                           |
| GET       | /v1/states/{state}/cities/:city?radius={number}        | List cities within a {number} mile radius of a city                                  |
| POST      | /v1/users/{user}/visits?city={city name}&state={state} | Allow a user to update a row of data to indicate they have visited a particular city |
| GET       | /v1/users/{user}/visits                                | Return a list of cities the user has visited                                         |
  
##Pagination
All of the endpoints are paginated, in order to view more results simply add 'page(number)' to endpoint

For Example:
```
  /v1/states/{state}/cities?page(3)
``` 
Would return the third page of results

##JSON
All endpoints return results in JSON

---
Requirements
------------

#### Ruby version
2.1.3p242 (2014-09-19 revision 47630)

#### Dependencies
```
  byebug
  coffee-rails (~> 4.1.0)
  jbuilder (~> 2.0)
  jquery-rails
  kaminari
  pg
  rails (= 4.2.0)
  rspec-rails
  sass-rails (~> 5.0)
  sdoc (~> 0.4.0)
  spring
  turbolinks
  uglifier (>= 1.3.0)
  web-console (~> 2.0)
```  


