class Element
  attr_accessor :x, :y, :radius, :directions, :sym

  def initialize(y,x,r,d,sym)
    @x = x.to_i
    @y = y.to_i
    @radius = r.to_i
    @directions = d.downcase.split('')
    @sym = sym

    @activated = false
  end

  def activate!
    @sym = 'X'
    @activated = true
  end

  def activated?
    return @activated
  end
end
