require 'capybara/poltergeist'

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.javascript_driver = :poltergeist
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
    :window_size => [1440, 900]
  )
end
