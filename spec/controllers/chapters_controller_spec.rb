require 'rails_helper'

describe ChaptersController do
  describe '#create' do
    it 'creates a chapter' do
      expect do
        post :create, chapter: FactoryGirl.attributes_for(:chapter)
      end.to change(Chapter, :count).by(1)
    end
  end
end
