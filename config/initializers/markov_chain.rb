content = ''
Dir['lib/assets/books/*.txt'].each do |f|
  content += File.read(f)
end

MC = MarkovChain.new(content)
