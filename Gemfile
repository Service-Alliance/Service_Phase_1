source 'https://rubygems.org'
ruby '2.4.2'
#ruby-gemset=service_alliance

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
# Use postgresql as the database for Active Record
gem 'pg', '~>0.20' # increase this version only after migration to Rails 5.0.
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'dotenv-rails', :groups => [:development, :test]
gem 'pundit'
gem 'devise'
gem 'bootstrap-sass', '~> 3.3'
gem 'geocoder'
gem 'httparty'
gem 'rails_12factor', group: :production
gem 'carrierwave', '~> 1.0'
gem "fog-aws"
gem "prawn"
gem 'combine_pdf'
gem 'honeybadger', '~> 3.1'
gem 'public_activity'
gem "select2-rails"
gem 'ransack'
gem 'kaminari'
gem 'activeadmin', '~> 1.1'
gem 'chartkick'
gem 'groupdate'
gem 'pg_search'
gem 'whenever', :require => false
gem 'best_in_place', '~> 3.0.1'
gem 'jquery-atwho-rails'
gem 'jquery-ui-rails'
gem 'simple_form'
gem 'tsheets', github: 'tsheets/api_ruby'
gem 'font-awesome-rails'
gem 'cocoon'
gem 'slim-rails'
gem 'maily'
gem 'aasm'
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'
gem 'google-adwords-api'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Set's proper headers for Sendgrid
gem 'mail-x_smtpapi'
# Sendgrid integration to webhooks
gem 'gridhook'

# Use Unicorn as the app server
gem 'unicorn'
gem 'unicorn-worker-killer'

# Add source of code for every database query
gem 'marginalia'
gem 'seed_migration'

gem 'sidekiq'
gem 'gon'

group :development, :test do
  gem 'minitest-reporters'
  gem 'simplecov', :require => false
  gem 'single_test'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2'
  gem 'guard-minitest'
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'danger'
  gem 'simple_bdd'
  gem 'shoulda-matchers'
end

group :test do
  gem 'minitest-vcr'
  gem 'webmock'
  gem 'minitest-rails-capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'puma'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-mini-profiler', require: false
  gem 'memory_profiler', require: false
  gem 'm'
  gem 'letter_opener_web'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Bullet is used to detect N+1 queries and unused eager loading
  gem 'bullet'
end
