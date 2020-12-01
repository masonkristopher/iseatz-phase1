# iSeatz - Phase 1

**A Rails restaurant API for iSeatz.**

This API returns city and restaurant data from Zomato's open API for iSeatz. 

All responses come in standard JSON. All requests must include a personal `api-key` in the request header.

- [iSeatz](https://www.iseatz.com/) - https://www.iseatz.com/
- [Zomato API](https://developers.zomato.com/documentation) - https://developers.zomato.com/documentation

## Versions
This API requires both **Ruby** and **Ruby on Rails** to be installed locally. For best performance, make sure Ruby and Rails are updated to the following versions:

- Ruby 2.7.2 - https://www.ruby-lang.org/en/documentation/installation/
- Rails 6.0.3.4 - http://installrails.com/


## Run Server Locally
  1. Navigate to root directory, `phase1api`

  2. Install dependency gems:
      ```
      bundle install
      ```

  3. Start the server on `localhost:3000`:
      ```
      rails server
      ```

  4. Once server is running, open API docs at http://localhost:3000/api-docs/

  5. Make API requests to http://localhost:3000/api/ through cURL, Postman, or in browser via Swagger


## Documentation
This API uses [Rswag](https://github.com/rswag/rswag) to document endpoints. For more detailed API documentation, response schemas, and to test the API in the browser, run the server locally and open http://localhost:3000/api-docs/.

Import this APIs Postman collection from `phase1api/iSeatz-Zomato-KMason-Postman.json`.

*Please note that a personal API key must be included in the request header as `api-key`.*


### API Overview
- **Endpoint 1:** /api/cuisines/?city={city}
  - Takes two params: city string (in path) and personal API key (in headers).
  - Returns an object with city info and list of cuisines in that city:
    ```json
    {
      "id": 0,
      "name": "string",
      "state": "string",
      "state_code": "string",
      "country": "string",
      "total_cuisines": 0,
      "cuisines": [
        {
          "name": "string",
          "id": 0
        }
      ]
    }
    ```

- **Endpoint 2:** /api/reviews/?city_id={city_id}&cuisine_id={cuisine_id}
  - Takes three params: city id and cuisine id (in path) and personal API key (in headers).
  - Returns an array of top 5 restaurants in that city, each object containing restaurant information and an array of most recent 5 review objects.
    ```json
    [
      {
        "name": "string",
        "id": "string",
        "address": "string",
        "location": "string",
        "city_id": 0,
        "reviews": [
          {
            "rating": 0,
            "review_text": "string",
            "id": "string",
            "rating_color": "string",
            "review_time_friendly": "string",
            "rating_text": "string",
            "timestamp": "string",
            "likes": 0,
            "user": {
              "name": "string",
              "foodie_color": "string",
              "profile_url": "string",
              "profile_image": "string",
              "profile_deeplink": "string"
            },
            "comments_count": 0
          }
        ]
      }
    ]
    ```


## Dependencies
In addition to the standard Ruby on Rails Gemfile, this API makes use of:
- [Faraday](https://lostisland.github.io/faraday/) & [Faraday Middleware](https://github.com/lostisland/faraday_middleware) for handling HTTP requests
- [Optimized JSON](http://www.ohler.com/oj/) for fast JSON parsing
- [Rswag](https://github.com/rswag/rswag) for API documentation
- [Rubocop](https://rubocop.org/) for linting


## Linting
This API uses [Rubocop](https://rubocop.org/) as a code linter and formatter.

To check format and style in the entire directory, run:
```bash
rubocop
```
Lint specific files or directories:
```bash
rubocop app/controllers app/models app/services/zomato.rb
```
Autocorrect while linting with the `-a` flag (safe mode) or `-A` (safe and unsafe). Find out more in [Rubocop Basic Usage](https://docs.rubocop.org/rubocop/1.3/usage/basic_usage.html).
