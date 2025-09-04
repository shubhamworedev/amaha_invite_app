## Amaha Invite API

A simple Rails API that filters customers within 100km of Mumbai office using the Haversine formula.
Includes RSpec tests and Swagger API documentation.

## Prerequisites
- Ruby 3.3.0  
- Rails 7.2.2  
- PostgreSQL


## Setup Instructions

1. Clone the repository
   git clone https://github.com/shubhamworedev/amaha_invite_app.git
   cd amaha_invite_app

2. Install dependencies
   bundle install

3. Setup RSpec
   rails generate rspec:install

4. Setup Rswag (for Swagger docs)
   rails generate rswag:api:install
   rails generate rswag:ui:install
   rails generate rswag:specs:install

5. Run tests
   bundle exec rspec

6. Generate Swagger documentation
   rake rswag:specs:swaggerize

7. Start the server
   rails s

8. Test the API Using Swagger UI (recommended)

   Open your browser and go to:

   http://localhost:3000/api-docs


## Project Structure

* app/controllers/api/v1/customers\_controller.rb → Handles file upload and returns filtered customers
* app/services/customer\_filter\_service.rb → Filters customers within 100km of Mumbai office
* app/services/distance\_calculator.rb → Calculates distance using the Haversine formula
* spec/ → RSpec tests and Swagger integration tests