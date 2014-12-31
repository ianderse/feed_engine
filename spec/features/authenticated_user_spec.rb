require 'rails_helper'

describe 'authenticated user', type: :feature do
  include Capybara::DSL

  before do
    sign_in_with_twitter
  end

  it 'can visit dashboard' do
    visit '/dashboard'
    expect(page).to have_content "Welcome, Yukon Cornelius"
  end

  it 'can log out' do
    visit '/dashboard'
    click_on('Log Out')
    expect(page).to_not have_content "Welcome, Yukon Cornelius"
    expect(page).to have_content "Log in with Twitter"
  end

  it 'can create a new habit', js: true do
    visit '/dashboard'
    expect(page).to_not have_content 'push ups'
    click_on('Create Custom Habit')
    page.fill_in('Habit', with: 'push ups')
    click_on('Create Habit')
    expect(page).to have_content 'push ups'
  end

  #
  # it 'can receive a tweet', js: true do
  #   visit '/dashboard'
  #   click_on('Create Custom Habit')
  #   expect(page).to have_css('#manage-habit-form')
  # end

  it 'can receive a tweet', js: true do
    skip
    visit '/dashboard'
    click_on('Create Custom Habit')
    expect(page).to have_css('#manage-habit-form')
  end

  it 'can view habit details'
  it 'can edit a habit'
  it 'can delete a habit'

  it 'can add notification to a habit', js: true do
    user = User.first
    visit '/dashboard'
    click_on('Create Custom Habit')
    page.fill_in('Habit', with: 'push ups')
    click_on('Create Habit')
    visit '/dashboard'
    expect(page).to have_content('push ups')
    expect(user.habits.first.notifications).to be_falsey
    check('notification_ids[]')
    page.find('#update-notifications').click
    visit '/dashboard'
    expect(user.habits.first.notifications).to be_truthy
  end

end
