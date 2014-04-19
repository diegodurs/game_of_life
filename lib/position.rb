class Position
  def initialize(x,y)
    @x = x
    @y = y
  end

  def surrounding?(x,y)
    if y == @y
      return true if [@x+1, @x-1].include?(x)
    end
    if x == @x
      return true if [@y+1, @y-1].include?(y)
    end
    # top right
    return true if x + 1 == @x && y + 1 == @y
    # top left
    return true if x - 1 == @x && y + 1 == @y
    # bottom right
    return true if x + 1 == @x && y + 1 == @y
    # bottom left
    return true if x - 1 == @x && y - 1 == @y
    return false
  end

  def surrounding_indexes
    indexes = []
    3.times { |i| indexes << [@x-1, i] }
    3.times { |i| indexes << [@x+1, i] }
    indexes << [@x, @y-1]
    indexes << [@x, @y+1]
    return indexes
  end
end