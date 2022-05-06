require_relative '../calculator_exercise/calculator'

RSpec.describe 'word collector' do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'adds two values together' do
      expect(calculator.add(2, 3)).to eq 5
      expect(calculator.add(0, 10)).to eq 10
    end
  end

  describe '#subtract' do
    it 'subtracts one values from another' do
      expect(calculator.subtract(5, 2)).to eq 3
      expect(calculator.subtract(30, 1)).to eq 29
    end
  end

  describe '#multiply' do
    it 'multiplies two values' do
      expect(calculator.multiply(4, 8)).to eq 32
      expect(calculator.multiply(1, 1)).to eq 1
    end
  end

  # bonus exercise
  describe '#square_root' do
    it 'returns the square root of a number' do
      expect(calculator.square_root(100)).to eq 10
      expect(calculator.square_root(49)).to eq 7
      expect(calculator.square_root(4)).to eq 2
    end
  end

  describe '#divide' do
    it 'divides two values' do
      expect(calculator.divide(8, 4)).to eq 2
      expect(calculator.divide(1, 1)).to eq 1
      expect(calculator.divide(9.0, 2.0)).to eq 4.5
    end
  end
end
