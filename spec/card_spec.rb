require_relative '../cards/deck'

RSpec.describe 'word collector' do
  let(:card) { Card.new('2', 'diamonds') }

  describe '#rank' do
    it 'returns the rank' do
      expect(card.rank).to eq '2'
    end
  end

  describe '#suit' do
    it 'returns the suit' do
      expect(card.suit).to eq 'diamonds'
    end
  end

  describe '#to_s' do
    it 'returns a string with the rank and suit' do
      expect(card.to_s).to eq '2 of diamonds'
    end
  end

  describe '#beats' do
    it 'return true if the value of the card is higher than another card' do
      card1 = Card.new('5', 'clubs')
      card2 = Card.new('3', 'clubs')
      expect(card1.beats(card2)).to eq true
    end

    it 'return true if the value of the card is higher than another card' do
      card1 = Card.new('king', 'clubs')
      card2 = Card.new('queen', 'clubs')
      expect(card1.beats(card2)).to eq true
    end

    it 'return false if the value of the card is lower than another card' do
      card1 = Card.new('ace', 'clubs')
      card2 = Card.new('jack', 'clubs')
      expect(card1.beats(card2)).to eq false
    end

    it 'return false if the value of the card is lower than another card' do
      card1 = Card.new('3', 'clubs')
      card2 = Card.new('4', 'clubs')
      expect(card1.beats(card2)).to eq false
    end
  end
end
