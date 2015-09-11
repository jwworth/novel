class Chapter < ActiveRecord::Base
  before_create :build

  private

  def build
    self.title = build_title

    mc = MarkovChain.new(File.read(Rails.root.join('lib', 'assets', 'siddhartha.txt')))
    body = []
    rand(1..3).times do
      body << mc.build_paragraph
    end
    self.body = body.join(' ')
  end

  def build_title
    %w(assist betrayal yoink).sample.upcase
  end
end
