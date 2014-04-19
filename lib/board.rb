require 'cells_collection'
require 'ruler'

class Board
  attr_reader :cells

  def initialize
    @cells = CellsCollection.new
    @playing = false
    @tick_counter = 0
  end

  def play
    while(playing?) do
      tick
    end
  end

  def add_living_cell(pos_x, pox_y)
    raise SetUpFreezed if playing?
    cells.set_alive(pos_x, pox_y)
  end

  def alive?(pos_x, pox_y)
    cells.at(pos_x, pox_y).alive?
  end

  def dead?(pos_x, pox_y)
    cells.at(pos_x, pox_y).dead?
  end

  def playing?
    @playing
  end

  def tick
    @playing = true
    Ruler.rules.each do |rule|
      rule.new(cells).execute
    end
  end

  class SetUpFreezed < StandardError ; end
end