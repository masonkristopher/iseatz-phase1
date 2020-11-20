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

This API uses [Faraday](https://lostisland.github.io/faraday/) and [Faraday Middleware](https://github.com/lostisland/faraday_middleware) to create and parse HTTP requests.

Install gems with the `bundle` command:

```bash
bundle
```
## Run Locally

Start the server on `localhost:3000`:
```bash
rails server
```

## Documentation


## Linting
This API uses [Rubocop](https://rubocop.org/) as a code linter and formatter.

To check code style in the entire directory, run:
```bash
rubocop
```
Lint specific files or directories:
```bash
rubocop app/controllers app/models app/services/zomato.rb
```
Rubocop can also autocorrect while linting with the `-a` flag (safe mode) or `-A` (safe and unsafe). Find out more in [Rubocop Basic Usage](https://docs.rubocop.org/rubocop/1.3/usage/basic_usage.html).

## Testing