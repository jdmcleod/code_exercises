require_relative ('./animal')

class Dog < Animal
  def speak
    puts 'Dog say ruff'
  end

  def type
    'Canine'
  end
end
