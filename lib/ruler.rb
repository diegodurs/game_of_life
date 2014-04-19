class Ruler
  def self.rules
    [
      GOLRule1,
      GOLRule2,
      GOLRule3
    ]
  end

  class Rule
    def initialize(cells)
      @cells = cells
    end

    def count_neighbours_alive(x,y)
      @cells.surrounding(x,y).count do |cell|
        cell.alive?
      end
    end
  end

  class GOLRule1 < Rule
    def execute
      @cells.each do |x,y,cell|
        cell.die! if cell.alive? && count_neighbours_alive(x,y) < 2
      end
    end
  end

  class GOLRule2 < Rule
    def execute
      @cells.each do |x,y,cell|
        cell.live! if cell.alive? && (2..3).include?(count_neighbours_alive(x,y))
      end
    end
  end
  class GOLRule3 < Rule
    def execute
      @cells.each do |x,y,cell|
        cell.die! if cell.alive? && count_neighbours_alive(x,y) > 3
      end
    end
  end
end