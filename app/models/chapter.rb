class Chapter < ActiveRecord::Base
  validates_presence_of :title, :body
  before_validation :build

  private

  def build
    self.title = build_title

    content = ''
    Dir['lib/assets/books/*.txt'].each do |f|
      content += File.read(f)
    end

    mc = MarkovChain.new(content)
    body = []
    rand(1..3).times do
      body << mc.build_paragraph
    end
    self.body = body.join(' ')
  end

  def build_title
    title = []
    @nouns ||= File.read(Rails.root.join('lib', 'assets', 'nounlist.txt')).split(' ')
    rand(1..2).times do
      title << @nouns.sample
    end
    title.join(' ').upcase
  end
end
