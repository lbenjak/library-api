source "https://rubygems.org"

ruby "3.2.2"

gem 'active_type'
gem 'infinum_json_api_setup'
gem 'jsonapi-query_builder'
gem 'jsonapi-serializer'
gem 'memoist'
gem 'pry-byebug'
gem 'pry-rails'
gem 'pundit'
gem "rails", "~> 7.1.2"

gem "sqlite3", "~> 1.4"

gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false
gem "pg"

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'pundit-matchers'
  gem 'shoulda-matchers'
end
