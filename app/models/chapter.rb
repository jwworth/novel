class Chapter < ActiveRecord::Base
  validates_presence_of :title, :body
  before_validation :build

  private

  def build
    self.title = build_title
    self.body = rand(2..5).times.map do
      MC.build_paragraph
    end.join(' ')
  end

  def build_title
    @nouns ||= File.read(Rails.root.join('lib', 'assets', 'nounlist.txt')).split(' ')
    rand(1..2).times.map do
      @nouns.sample
    end.join(' ').upcase
  end
end
