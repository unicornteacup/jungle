# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. TDD (test-driven development) practices are followed using RSpec library. Stripe platform is used for payments.

## Project Features
- Admin users can list and create new categories
- Admins can add new products using the new category
- Visitors can go to the registration page from any page in order to create an account
- Visitors can sign up for a user account with e-mail, password, first name and last name
- Visitors can sign in using e-mail and password
- Visitors can log out from any page

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Home Page
!["jungle-home-page"](https://github.com/unicornteacup/jungle/blob/master/docs/Screen%20Shot%202020-08-25%20at%206.18.01%20PM.png?raw=true)

_main page displaying the products_

## Cart
!["jungle-cart"](https://github.com/unicornteacup/jungle/blob/master/docs/Screen%20Shot%202020-08-25%20at%206.18.35%20PM.png?raw=true)

_user cart with added items_

## Admin Page
!["jungle-admin-dashboard"](https://github.com/unicornteacup/jungle/blob/master/docs/Screen%20Shot%202020-08-25%20at%206.19.13%20PM.png?raw=true)

_admin dashboard for editing items for sale_

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
