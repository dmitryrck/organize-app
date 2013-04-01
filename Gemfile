source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0.beta1'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git', :branch => 'rails4'
gem 'devise-i18n'
gem 'simple_form'
gem 'show_for'
gem 'jquery-rails'
gem 'puma'
gem 'foreman'
gem 'kaminari'

group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'heroku'
end

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'poltergeist'
  gem 'database_cleaner', :git => 'git://github.com/bmabey/database_cleaner.git'
end

gem 'jquery-rails'
