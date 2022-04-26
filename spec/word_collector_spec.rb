require_relative '../word_collector'

RSpec.describe 'word collector' do
  let(:word_collector) { WordCollector.new }

  describe '#process_words' do
    it 'tracks lowercase letters as greys' do
      words = ['cranE', 'dRanE']
      expected_array = ['c', 'a', 'n', 'd']
      word_collector.process_words(words)
      expect(word_collector.greys).to match_array expected_array
    end

    it 'tracks uppercase letters as yellows' do
      words = ['cRanE', 'ERror']
      expected_yellows = { 'r' => [1], 'e' => [4, 0]}
      word_collector.process_words(words)
      expect(word_collector.yellows).to match_array expected_yellows
    end

    it 'tracks greens if they are preceeded by >' do
      words = ['cRa>nE', '>find>S']
      expected_greens = { 'n' => [3], 'f' => [0], 's' => [4] }
      word_collector.process_words(words)
      expect(word_collector.greens).to match_array expected_greens
    end

    it 'removes yellows and greys if replaced by green' do
      words = ['scArF', '>find>S']
      expected_greens = { 'f' => [0], 's' => [4] }
      word_collector.process_words(words)
      expect(word_collector.greens).to match_array expected_greens
      expect(word_collector.yellows).to match_array({ 'a' => [2] })
      expect(word_collector.greys).to match_array [ 'c', 'r', 'i', 'n', 'd']
    end
  end
end
