source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'pry'
gem 'bcrypt', '~> 3.1.7'
gem 'rb-readline'
gem 'paperclip'
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-s3', '~> 1'
gem 'figaro'
gem 'alphabetical_paginate'
gem 'will_paginate', '~> 3.1.0'
gem 'rails3-jquery-autocomplete'
gem 'nifty-generators'
gem 'jquery-ui-rails'
gem 'twitter-typeahead-rails'
gem 'faker'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :test do
  gem 'webmock'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'rails_12factor', group: :production

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
