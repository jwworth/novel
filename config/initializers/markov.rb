string = if Rails.env.production?
  Dir['lib/assets/books/*.txt'].map { |f| File.read(f) }.join
else
  File.read(Rails.root.join('lib', 'assets', 'books', 'siddhartha.txt'))
end

# Strip Project Gutenberg-specific noise
string.gsub!(/^[A-Z\s]+$/, '')
string.gsub!(/http\S+/, '')

MARKOV = Remarkovable.new(string: string)
