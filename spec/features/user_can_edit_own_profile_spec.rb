require 'rails_helper'

describe 'as a registered user' do
  describe 'when i visit my profile page' do
    it 'should see a link to edit profile date' do
      registered_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(registered_user)

      visit user_path(registered_user)

      click_link("Edit Information")

      expect(current_path).to eq(profile_edit_path)
      expect(page).to have_css("#user-form")

      name = "Hello"

      fill_in :user_name, with: name
      click_on("Update User")

      expect(current_path).to eq(profile_path)

      expect(page).to have_content(name)
      expect(page).to have_content("Your profile has been updated!")
    end
    it 'should redirect to edit if invalid information' do
      registered_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(registered_user)

      visit user_path(registered_user)

      click_link("Edit Information")

      expect(current_path).to eq(profile_edit_path)
      expect(page).to have_css("#user-form")

      zip = "Hello"

      fill_in :user_zipcode, with: zip
      click_on("Update User")

      expect(current_path).to eq(profile_edit_path)
    end
  end
end
