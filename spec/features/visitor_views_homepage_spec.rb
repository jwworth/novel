require 'rails_helper'

describe 'Visitor views homepage', type: :feature do
  context 'with chapters' do
    it 'and sees chapters' do
      FactoryGirl.create_list(:chapter, 3)
      visit root_path

      expect(page).to have_selector('.chapter', count: 3)
      expect(page).to have_selector('.body', count: 3)
      expect(page).to have_selector('.title', count: 3)
    end
  end

  context 'with no chapters' do
    it 'and sees a well-designed blank page' do
      visit root_path

      expect(page).to have_content('No chapters.')
      expect(page).to_not have_selector('.chapter')
      expect(page).to_not have_selector('.body')
      expect(page).to_not have_selector('.title')
    end
  end
end
