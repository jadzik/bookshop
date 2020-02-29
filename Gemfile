source 'http://rubygems.org'
gem 'rails', '3.1.1'
gem 'rake', '~> 12.3.3'
gem 'sqlite3'
gem 'haml'
gem 'devise', "~>2.0.0"
gem 'i18n'                #spolszczenia
gem 'activeadmin'
gem 'meta_search',    '>= 1.1.0.pre'
gem "paperclip", "~> 2.4" #zdjęcia
gem 'kaminari'            #paginacja
gem 'actionmailer' 
#gem "ransack"            #wyszukiwanie
gem 'yaml_db'             #do zrzutów bazy do yaml
gem 'cells'               #koszyk
gem 'coffee-rails', '~> 3.1.1'

group :producton do
  gem 'pg'
  gem 'therubyracer'
end 

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails',   '~> 3.1.4'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :development, :test do
  gem 'rspec-rails', '~> 2.7.0'
  gem 'factory_girl', '~> 2.0.0'
  gem 'factory_girl_rails', '~> 1.1.0'
end
group :test do
  gem 'capybara', '~> 1.1.1'
  gem 'shoulda', '~> 2.11.3'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'spork', '~> 0.9.0.rc9'
  gem 'guard-spork'
  gem 'guard-rspec'
end
