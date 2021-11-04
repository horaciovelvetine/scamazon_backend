# Scamazon

In transition to a FrontEnd / Backend copy of the O.G. 

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

## Some Tech: 

    - [Bootstrap](https://getbootstrap.com/)
      * As a part of Bootstrap this site includes [Popper](https://popper.js.org/) to handle dropdown and popover Javascript elements
    - [Devise](https://github.com/heartcombo/devise)
      * A robust Authorization tool which integrates [OmniAuth](https://github.com/omniauth/omniauth)
    - [Postgres SQL](https://www.postgresql.org/)
      * For the flexibility and added search functionality a more robust DB solution provides.
    - [Faker](https://github.com/faker-ruby/faker)
      * A spectacularly flexible tool for generating anything from quotes, to placeholder pictures to help make Scamazon feel a bit more real, as opposed to an empty storefront.