require_relative 'element'

class Grid
  attr_accessor :elements, :elements_on_deck

  def initialize(size, elements)
    @size = size.to_i
    @elements = elements

    @elements_on_deck = [@elements[0]]
  end

  def display
    output = ""
    (0..(@size-1)).each do |row|
      (0..(@size-1)).each do |col|
        output += elem_at( row, col ).sym
      end
      output += "\n"
    end
    output
  end

  def activate
    activated_elements = Array.new
    
    @elements_on_deck.each do |element|
      element.directions.each do |direction|
        (1..element.radius).each do |reach|
          case direction
          when 'l'
            guess = elem_at( element.x, element.y - reach )
          when 'r'
            guess = elem_at( element.x, element.y + reach )
          when 'u'
            guess = elem_at( element.x - reach, element.y )
          when 'd'
            guess = elem_at( element.x + reach, element.y )
          else
          end
          if guess.sym != ' ' and !guess.activated?
            guess.activate!
            activated_elements << guess
            next
          end
        end
      end
    end

    @elements_on_deck = activated_elements
    if !@elements_on_deck.empty?
      return true
    end
    false
  end
  
  def elem_at( col, row )
    @elements.each do |element|
      (element.x == col && element.y == row) ? (return element) : nil
    end
    return Element.new(-1,-1,0,'',' ')
  end
end
