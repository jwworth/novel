class MarkovChain
  def initialize(string)
    @markov_model = Hash.new { |hash, key| hash[key] = [] }
    prepare!(string)
    word_list = string.split(/([.!?])| /).map(&:strip)

    word_list.each_with_index do |word, index|
      pair = [word, word_list[index + 1]].join(' ')
      match = word_list[index + 2]
      add_triad(pair, match) if index < word_list.size - 2
    end
  end

  private

  def add_triad(pair, match)
    @markov_model[pair] = {} unless @markov_model[pair]
    @markov_model[pair] += [match]
  end

  def prepare!(string)
    # Strip excessives spaces
    string.gsub!(/\s+/, ' ')
    # String double quotes, they are hard to match
    string.gsub!(/"/, '')
    # Strip all-caps notes and comments
    string.gsub!(/^[A-Z\s]+$/, '')
  end

  def build_paragraph(sentences=5)
    paragraph = []

    sentences.times do
      paragraph << build_sentence
    end

    paragraph.join(' ') + "\n\n"
  end

  def build_sentence
    pair = @markov_model.keys.sample
    output = [] << pair.capitalize.split(' ')

    until (output & %w(. ! ?)).any?
      match = @markov_model[pair].sample
      if match.nil?
        pair = @markov_model.keys.sample
        next
      end
      output << match
      output.flatten!
      pair = [output[-2], output[-1]].join(' ')
    end

    output.join(' ').squeeze(' ').gsub(/\s+([,.!?])/, '\1')
  end
end
