require 'rails_helper'

describe 'an admin ' do
  it 'sees an admin specific navigation bar' do
    admin_1 = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_1)

    visit '/'

    within("#admin-nav-bar") do
      expect(page).to have_content("Home")
      expect(page).to have_content("Browse Items")
      expect(page).to have_content("Browse Merchants")
      # expect(page).to have_content("Profile")
      expect(page).to have_content("Browse All Users")

      expect(page).to have_content("Logout")

      expect(page).not_to have_content("Cart: 0")
      expect(page).not_to have_content("Dashboard")


      expect(page).to have_content("Logged in as #{admin_1.name}")
    end

    have_link("home_link", href: '/')
    have_link("items_link", href: '/items')
    have_link("merchants_link", href: '/merchants')
    have_link("profile_link", href: '/profile')
    have_link("admin_users_link", href: '/admin/users')
    have_link("user_orders_link", href: '/orders')
    have_link("logout_link", href: '/logout')

  end
end
