source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0.rc1'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git', :branch => 'rails4'
gem 'devise-i18n'
gem 'simple_form'
gem 'show_for'
gem 'jquery-rails'
gem 'kaminari'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
end

group :production, :development do
  gem 'puma'
  gem 'foreman'
end

group :development do
  gem 'heroku'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
end

group :test do
  gem 'poltergeist'
  gem 'database_cleaner', :git => 'git://github.com/bmabey/database_cleaner.git'
end
