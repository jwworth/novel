require 'minitest/autorun'
require './app/models/markov_chain.rb'

class MarkovChainTest < Minitest::Test
  def test_add_pair_simple_case
    content = 'we are walking'
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => ['walking']
    }

    assert_equal expected_output, mc.markov_model
  end

  def test_add_pair_three_words_and_punctuation
    content = 'we (are) walking.'
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => ['walking'],
      'are walking' => ['.']
    }

    assert_equal expected_output, mc.markov_model
  end

  def test_add_pair_three_words_and_spaces
    content = 'we are    walking.'
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => ['walking'],
      'are walking' => ['.']
    }

    assert_equal expected_output, mc.markov_model
  end

  def test_add_pair_three_words_and_quotes
    content = 'we are "walking".'
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => ['walking'],
      'are walking' => ['.']
    }

    assert_equal expected_output, mc.markov_model
  end

  def test_add_pair_key_duplication
    content = 'we are walking we are talking we are walking.'
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => %w(walking talking walking),
      'are walking' => ['we', '.'],
      'walking we' => ['are'],
      'are talking' => ['we'],
      'talking we' => ['are']
    }

    assert_equal expected_output, mc.markov_model
  end

  def test_add_pair_with_newlines
    content = "we are walking\n\rwe are talking we are walking."
    mc = MarkovChain.new(content)
    expected_output = {
      'we are' => %w(walking talking walking),
      'are walking' => ['we', '.'],
      'walking we' => ['are'],
      'are talking' => ['we'],
      'talking we' => ['are']
    }

    assert_equal expected_output, mc.markov_model
  end
end
