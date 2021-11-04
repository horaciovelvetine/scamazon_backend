# Scamazon

Currently in the process of taking my original project and converting it in to a more fully flushed out backend to work be able to work with JS. Thanks for your patience -- HV
## Getting Started

  In order to start up Scamazon first fork and clone this repository locally. Then: 1. First youll need to install all of the dependencies using bundler, inside the root directory type:

    1. Insall Dependencies using Bundler:
      bundle install 

    2. Migrate the DB:
      rails db:migrate

    3. Seed the DB:
      rails db:seed

    4. In order to fully populate the store theres a built in controller and action to create users who have stores full of items to interact with using the Faker gem. First start up Puma (the local server). *Note that on startup there WILL be an error. Loading the homepage queries the DB for a few items to show you, since none yet exist theres an error.

      rails s

    5. Then navigate to built in: [The Seed Action](localhost:port/seed)
      
      //follow the onscreen instructions to create the desired number of users
      
  Great!! Now you should be redirected back to the home page and ready to go. *fin*

## An Explainer

  Scamazon was built as my first Rails application built as a part of my graduation from the Flatiron School's full stack web developer course and is inteded purely for my own edification. 

## Known Issues :
  - Store EIN seed is only seeding first 2 char --> change data type to string!
  
