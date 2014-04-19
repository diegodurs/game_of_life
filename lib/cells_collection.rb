require 'position'

class CellsCollection
  def initialize
    @collection = []
  end

  def at(x,y)
    if value_at(x,y).nil?
      return Cell.dead
    else
      return value_at(x,y)
    end
  end

  def set_alive(x,y)
    set(x,y, Cell.alive)
  end

  def surrounding(ref_x,ref_y)
    indexes = Position.new(ref_x, ref_y).surrounding_indexes
    surrounding = []
    indexes.each do |index|
      surrounding << at(index[0], index[1])
    end
    return surrounding
  end

  def each(&blk)
    @collection.each_with_index do |array_y, x|
      next if array_y.nil?
      array_y.each_with_index do |cell, y|
        next if cell.nil?
        yield x,y,cell
      end
    end
  end
private
  def value_at(x, y)
    if @collection[x]
      @collection[x][y]
    end
  end

  def set(x,y, value)
    @collection[x] = [] unless @collection[x]
    @collection[x][y] = value
  end

  class Cell
    attr_accessor :alive

    def self.alive
      new(alive: true)
    end
    def self.dead
      new(alive: false)
    end

    def initialize(alive: true)
      @alive = alive
    end

    def die!
      @alive = false
    end

    def live!
      @alive = true
    end

    def alive?
      @alive
    end

    def dead?
      not alive?
    end
  end
end