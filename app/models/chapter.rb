class Chapter < ActiveRecord::Base
  validates_presence_of :title, :body
  before_validation :build

  private

  def build
    self.title = build_title

    body = []
    rand(2..5).times { body << MC.build_paragraph }
    self.body = body.join(' ')
  end

  def build_title
    title = []
    @nouns ||= File.read(Rails.root.join('lib', 'assets', 'nounlist.txt')).split(' ')
    rand(1..2).times { title << @nouns.sample }
    title.join(' ').upcase
  end
end
