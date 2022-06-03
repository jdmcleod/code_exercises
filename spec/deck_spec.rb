require_relative '../cards/deck'

RSpec.describe 'word collector' do
  let(:deck) { Deck.new }

  describe '#build_deck' do
    it 'creates 52 cards' do
      deck.build_deck
      expect(deck.cards.count).to eq 52
    end
  end

  describe '#shuffle' do
    it 'shuffles the cards in the deck' do
      # given
      deck.build_deck
      orignial_order = deck.cards.map(&:rank)
      # when
      deck.shuffle
      # then
      expect(deck.cards.map(&:rank)).to_not eq orignial_order
    end
  end

  describe '#deal' do
    it 'deals a card from the top of the deck' do
      deck.build_deck
      card = deck.deal
      expect(deck.cards.length).to eq 51
    end
  end
end
