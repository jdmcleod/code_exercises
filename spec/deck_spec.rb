require_relative '../cards/deck'

RSpec.describe 'word collector' do
  let(:deck) { Deck.new }

  describe '#build_deck' do
    it 'creates 52 cards' do
      deck.build_deck
      expect(deck.cards.count).to eq 52
    end
  end
end
