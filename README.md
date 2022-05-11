# Jungle
## Project Description

A mini e-commerce application built with Rails 6.1 for the purpose of learning Rails by example.

Many features of this project were already in place. The new features and bug fixes I implemented are listed in the [What's New section](#whats-new).

## Product Screenshots
- home page
!["home page"](https://github.com/GraceWXT/jungle-rails/blob/master/doc/home_page.png?raw=true)
- order detail
!["order detail"](https://github.com/GraceWXT/jungle-rails/blob/master/doc/order_detail.png?raw=true)
- admin dashboard
!["admin dashboard"](https://github.com/GraceWXT/jungle-rails/blob/master/doc/admin_dashboard.png?raw=true)
- admin >> categories
!["admin categories"](https://github.com/GraceWXT/jungle-rails/blob/master/doc/admin_categories.png?raw=true)

## What's New
### New Features
- About Us
  [x] A page that contains static content that describes the store
  [x] Update the link in the app footer
- Admin Dashboard Page
  [x] Display the general stats (product and category count) about the store
  [x] Link to the product admin list/index pages when displaying the counts
- Order Details Page
  [x] The order page contains items, their image, name, description, quantities and line item totals
  [x] The final amount for the order is displayed
  [x] The email that was used to place the order is displayed
  [x] A visitor can place an order (i.e. without logging in and therefore without an e-mail address)
- Sold out badge:
  [x] To be displayed when the product is not in stock when a product has 0 quantity.
- Admin Categories:
  [x] Admins can list and create new categories
  [x] Admins can add new products using the new category
  [x] Restful routes (resources) should be used, and there should be no extra, unused routes exposed
- User Authentication
  [x] User authentication is implemented with bcrypt and has_secure_password in the User model
  [x] A vistor can go to the registration page from any page in order to create an account
  [x] A visitor can sign up for an account with e-mail, password, first name and last name
  [x] A visitor cannot sign up with an existing e-mail address (uniqueness validation)
  [x] A visitor can sign in using the correct e-mail and password
  [x] A visitor can log out from any page


### Bug Fixes
- Admin Security
  [x] Users must enter HTTP auth login/password to access admin functionality
- Checking Out with Empty Cart
  [x] When the cart is empty and the user goes to the carts#show page, display a friendly message about how it is empty and link to the home page
- Money formatting
  [x] Fix any inconsistent money formatting in the app


### Tests
- Rspec
  [x] Product model validation
  [x] User model validation
- Cypress
  [x] Users can visit the home page which renders a list of all products
  [x] Users can navigate from the home page to the product detail page by clicking on a product
  [x] Users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` on vagrant / `bin/rails server` on host machine to start the server
9. Navigate to `http://localhost:3000/`

<!-- ## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user. -->

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
