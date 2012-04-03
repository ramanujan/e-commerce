source 'https://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'pg'
gem 'bootstrap-sass'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test,:development do
  gem 'sqlite3'
  gem 'rspec-rails','2.9.0'
  gem 'execjs'
end

group :test do
  gem 'spork' 
  gem 'cucumber-rails', require:false;
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem "launchy"
end
