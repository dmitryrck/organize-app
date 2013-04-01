module Helpers
  def login user = nil
    user ||= User.create(
      :email => 'user@mail.com',
      :password => 'password'
    )

    visit root_path

    fill_in 'E-mail', :with => user.email
    fill_in 'Senha', :with => user.password

    click_button 'Logar'

    expect(page).to have_content 'user@mail.com'
  end
end

RSpec.configure do |config|
  config.include Helpers, :type => :feature
end
