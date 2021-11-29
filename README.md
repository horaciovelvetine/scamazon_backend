## Scamazon an API:

Scamazon_Backend is a Rails API built as a part of the Flatiron School's Software Developement curriculum. It is a *limited* Rails 6 copy of the Amazon.com webstore, and is intended only for educational purposes on my journey to become a full stack engineer. 


## Getting Started: 
1. Fork/Clone this repository to your machine. 
2. Inside of the dir, first setup your DB (this repo uses Postgresql, you can download that here: https://www.postgresql.org/). 
    ```rails:db setup```
3. Run all of the migrations to setup tables: 
    ```rails:db migrate```
4. Seed the DB with the neccasary info (categories and status')
    ```rails:db seed```
5. This should set you up with a very empty and ready to roll backend which should for the most part reflect the e-commerce portion of Amazon.com 's offerings. 
6. Opt: If you would like to add in some data to populate Scamazon with X number of Fake User's (who all will have: Stores w/ Items, Lists w/ Items, and finished orders etc.), simply visit www.localhost:port/seed. This built in page contains a form which will create X number of these fake Users and Items and persist them to the DB. 

## Tech Overview: 

As a part of this ongoing project I've chosen to include a few additional pieces of technology that I wanted to learn. You can find resources for those gems/libraries here: 
- Bootstrap: https://getbootstrap.com/ (V5)
- Devise: https://github.com/heartcombo/devise
- Faker: https://github.com/faker-ruby/faker
- PostgreSql: https://www.postgresql.org/
- Pg Search: https://www.postgresql.org/
- JQueery (Rails): https://github.com/rails/jquery-rails

## Contributing: 
Bug reports and pull requests on GitHub: https://github.com/horaciovelvetine/scamazon_backend. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct. Additionally, there are some bad jokes throughout that are in no way shape or form intended as anything but satire, if you don't find them funny, you're not the only one.

## Layout Visual/Overview
![Scamazon V1 1 1 map](https://user-images.githubusercontent.com/78946408/143947036-bbebbfe5-97ee-4cd6-a56a-69406bd9c67a.png)

