require 'pry'

class Animal
  def initialize(name)
    @name = name
    @food = 0
  end

  def speak
    puts "#{@name} says Hi"
  end

  def feed(food)
    @food += food
  end

  def type
    'Animal'
  end
end

animal = Animal.new('Fishy')


