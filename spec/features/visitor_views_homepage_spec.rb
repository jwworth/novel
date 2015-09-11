require 'rails_helper'

describe 'Visitor views homepage', type: :feature do
  it 'and sees chapters' do
    FactoryGirl.create_list(:chapter, 3)
    visit root_path

    expect(page).to have_selector('.chapter', count: 3)
  end

  it 'and sees a well-designed blank page' do
    visit root_path

    expect(page).to have_content('No chapters.')
    expect(page).to_not have_selector('.chapter', count: 3)
  end
end
