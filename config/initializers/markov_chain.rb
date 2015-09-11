string = ''

if Rails.env.production?
  Dir['lib/assets/books/*.txt'].each do |f|
    string += File.read(f)
  end
else
  string += File.read(Rails.root.join('lib', 'assets', 'books', 'siddhartha.txt'))
end

# Strip Project Gutenberg-specific noise
string.gsub!(/^[A-Z\s]+$/, '')
string.gsub!(/http\S+/, '')

MC = MarkovChain.new(string)
