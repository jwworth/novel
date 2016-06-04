require 'rails_helper'

describe ChaptersController do
  describe '#create' do
    it 'creates a chapter' do
      expect do
        post :create, params: { chapter: { title: 'Foo', body: 'bar' } }
      end.to change(Chapter, :count).by(1)
    end
  end
end
