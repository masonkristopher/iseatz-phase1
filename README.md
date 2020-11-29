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

Verify the installed versions:
```bash
ruby -v
rails -v
```

## Install Dependencies

Change into `phase1api` and install gems with the `bundle install` command:

```bash
cd phase1api
bundle install
```
## Run Locally

Start the server on `localhost:3000`:
```bash
rails server
```

## Documentation
This API uses [Rswag](https://github.com/rswag/rswag) to test and document endpoints. For more detailed API documentation, response schemas, and to test the API in the browser, run the server locally and open `http://localhost:3000/api-docs/`.

### API Overview
- **Endpoint 1:** /api/cuisines/?city={city}
  - Takes two params: city string (in path) and personal API key (in headers).
  - Returns object with city info and list of cuisines in that city.
- **Endpoint 2:** /api/reviews/?city_id={city_id}&cuisine_id={cuisine_id}
  - Takes three params: city id and cuisine id (in path) and personal API key (in headers).
  - Returns array of top 5 restaurant objects in that city, each object containing restaurant information and array of most recent 5 review objects.

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
Rubocop can also autocorrect while linting with the `-a` flag (safe mode) or `-A` (safe and unsafe). Find out more in [Rubocop Basic Usage](https://docs.rubocop.org/rubocop/1.3/usage/basic_usage.html).
