source 'http://rubygems.org'

gem 'rails', '>= 5.0.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem 'therubyracer'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '>= 5.0.5'
  gem 'coffee-rails', '>= 4.1.1'
  gem 'uglifier', '>= 2.7.2'
end

gem 'jquery-rails', '>= 4.0.1'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end


#heroku for cedar stack
group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
  gem 'thin', '>= 1.5.0'
end

gem 'extr', '>= 1.0.2'
