ruby '2.4.2'
source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'mysql2'

gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'haml-rails', '~> 1.0'
gem 'recursive_struct'
gem 'admin_auth'

group :test do
  gem 'database_cleaner'
end

group :development, :test do
  gem 'capybara', '~> 3.18'
  gem 'capybara-webkit', '~> 1.15'
  gem 'factory_girl_rails'
  gem 'quiet_assets'
  gem 'pry'
  gem 'rspec-rails', '~> 3.8'
  gem 'travis'
end

group :development, :production do
  gem 'unicorn'
end

group :production do
  gem 'heroku-deflater'
  gem 'rails_12factor'
end
