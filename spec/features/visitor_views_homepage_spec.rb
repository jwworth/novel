require 'rails_helper'

describe 'Visitor views homepage', type: :feature do
  context 'with chapters' do
    it 'and sees chapters' do
      FactoryGirl.create_list(:chapter, 3)
      visit root_path

      expect(page).to have_selector('article', count: 3)
      expect(page).to have_selector('.body', count: 3)
      expect(page).to have_selector('.title', count: 3)
    end
  end

  context 'with no chapters' do
    it 'and sees a well-designed blank page' do
      visit root_path

      expect(page).to have_content('No chapters.')
      expect(page).to_not have_selector('article')
      expect(page).to_not have_selector('.body')
      expect(page).to_not have_selector('.title')
    end
  end

  context 'with pagination' do
    it 'splits on twenty posts' do
      FactoryGirl.create_list :chapter, 25
      visit root_path

      expect(page).to have_selector 'article', count: 20

      click_link "previous chapters"
      expect(page).to have_selector 'article', count: 5

      click_link "next chapters"
      expect(page).to have_selector 'article', count: 20
    end
  end
end
