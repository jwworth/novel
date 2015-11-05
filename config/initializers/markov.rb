string = if Rails.env.production?
  Dir['lib/assets/books/*.txt'].map { |f| File.read(f) }.join(' ')
else
  File.read(Rails.root.join('lib', 'assets', 'books', 'siddhartha.txt'))
end

MARKOV = Remarkovable.new(string: string)
