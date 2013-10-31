require_relative "grid"
require "test/unit"

class TestElement < Test::Unit::TestCase
  def setup
    @elem = Element.new(1, 2, 3, 'udr', 'A')
  end

  def test_coordinates
    assert_equal(1, @elem.x)
    assert_equal(2, @elem.y)
  end

  def test_is_not_activated
    assert( !@elem.activated? )
    assert_equal( 'A', @elem.sym )
  end

  def test_activated
    @elem.activate!
    assert( @elem.activated? )
    assert_equal( 'X', @elem.sym )
  end
end

class TestGrid < Test::Unit::TestCase
  def setup
    @elemA = Element.new(0, 0, 2, 'ud', 'A')
    @elemB = Element.new(1, 3, 1, 'd', 'B')
    @elemC = Element.new(4, 2, 2, 'udlr', 'C')
    @elemD = Element.new(1,1, 3, 'lr', 'D')
    @elems = [@elemA, @elemB, @elemC, @elemD]
    @grid = Grid.new(5, @elems)
  end

  def test_elem_at_1
    assert_equal( 'A', @grid.elem_at(0, 0).sym)
  end

  def test_elem_at_2
    assert_equal( 'C', @grid.elem_at(4, 2).sym)
  end

  def test_display
    grid_out = "A    \n D B \n     \n     \n  C  \n"
    print @grid.display
    assert_equal(grid_out, @grid.display)
  end
end
