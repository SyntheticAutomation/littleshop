require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit the login path" do
    describe "sees a field to enter my email and password" do
      it "and I can log in as a regular user or visitor" do
        email = "email1@gmail.com"
        password = "123"
        create(:user, email: email, password: password)

        visit login_path

        fill_in :user_email, with: email
        fill_in :user_password, with: password

        click_on "Log In"

        expect(current_path).to eq(profile_path)
        expect(page).to have_content("You are now logged in!")
      end
      it 'will be directed to my merchant dashboard if im a merchant' do
        email = "email1@gmail.com"
        password = "123"
        create(:user, email: email, password: password, role: 1)

        visit login_path

        fill_in :user_email, with: email
        fill_in :user_password, with: password

        click_on "Log In"

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
