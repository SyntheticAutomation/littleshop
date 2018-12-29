require 'rails_helper'

describe 'a visitor to our web app' do
  before(:each) do
    visit root_path
  end
  it 'sees a navigation bar' do
    within("#nav-bar") do
      expect(page).to have_content("Home")
      expect(page).to have_content("Browse Items")
      expect(page).to have_content("Browse Merchants")
      expect(page).to have_content("Cart: 0")
      expect(page).to have_content("Login")
      expect(page).to have_content("Register")
    end
  end
  it 'can click a navigation link and go to correct page' do
    click_on 'home-link'
    expect(current_path).to eq('/')

    click_on 'items-link'
    expect(current_path).to eq(items_path)

    click_on 'merchants-link'
    expect(current_path).to eq(merchants_path)

    click_on 'register-link'
    expect(current_path).to eq('/register')

    click_on 'login-link'
    expect(current_path).to eq('/login')
  end
end
