content = ''

if Rails.env.production?
  Dir['lib/assets/books/*.txt'].each do |f|
    content += File.read(f)
  end
else
  content += File.read(Rails.root.join('lib', 'assets', 'books', 'siddhartha.txt'))
end

MC = MarkovChain.new(content)
