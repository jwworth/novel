class Chapter < ActiveRecord::Base
  before_create :build

  private

  def build
    mc = MarkovChain.new(File.read(Rails.root.join('lib', 'assets', 'siddhartha.txt')))
    self.title = mc.build_sentence
    self.body = mc.build_paragraph
  end
end
