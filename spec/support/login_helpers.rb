module Login
  module Helpers
    def login user = nil
      user ||= User.create(
        :email => 'user@mail.com',
        :password => 'password'
      )

      visit root_path

      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password

      click_button 'Sign in'

      expect(page).to have_content 'user@mail.com'
    end
  end
end
