# Rack::DeleteCookiesFromPublicRequests

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rack/delete_cookies_from_public_requests`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-delete_cookies_from_public_requests'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-delete_cookies_from_public_requests

## Concept

The goal of this gem is to strip cookies from responses that are going to be cached publicly. This makes it possible to cache these pages on CDNs, and reverse proxies like varnish.

## Usage

To make the middleware available in all environments, open `config/application.rb` and add in `class Application < Rails::Application`:

```ruby
config.middleware.insert_before(ActionDispatch::Cookies, Rack::DeleteCookiesFromPublicRequests)
```

If you want to customize the environment in which the middleware is enabled edit the respective environment files instead.

You can verify the middleware positioning by typing `rake middleware` in the root of your application.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gja/rack-delete_cookies_from_public_requests.
