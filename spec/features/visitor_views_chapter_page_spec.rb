require 'rails_helper'

describe 'Visitor views chapter page', type: :feature do
  it 'and sees a chapter' do
    chapter = FactoryGirl.create :chapter
    visit root_path
    click_on chapter.title

    expect(current_path).to eq chapter_path(chapter)
    expect(page).to have_selector('article')
    expect(page).to have_selector('.body')
    expect(page).to have_selector('.title')
  end
end
