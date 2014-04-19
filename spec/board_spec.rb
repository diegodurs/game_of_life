require 'board'

describe Board do
  let(:board){ Board.new }
  it 'should initiliaze' do
    expect(board).to be_a(Board)
  end
  it 'set up cells should be alive' do
    board.add_living_cell(1,1)
    expect(board).to be_alive(1,1)
  end

  it 'non set cells should be dead' do
    expect(board).to be_dead(1,1)
  end

  it 'cells cannot be setup when one tick has been played' do
    board.tick
    expect{board.add_living_cell(1,1)}.to raise_error
  end

  context 'rule1 - living cell having less than two living neighbours' do
    it 'should die' do
      board.add_living_cell(1,1)
      board.add_living_cell(1,2)
      board.tick
      expect(board).to be_dead(1,2)
      expect(board).to be_dead(1,1)
    end
  end

  context 'rule2 - living cell having two or three living neighbours' do
    it 'should live' do
      board.add_living_cell(1,1)
      board.add_living_cell(1,0)
      board.add_living_cell(1,2)
      board.tick
      expect(board).to be_alive(1,0)
    end
  end

  context 'rule3 - living cell having more than three living neighbours' do
    it 'should die' do
      board.add_living_cell(1,1)

      board.add_living_cell(1,0)
      board.add_living_cell(0,1)
      board.add_living_cell(1,2)
      board.add_living_cell(2,1)
      board.tick
      expect(board).to be_dead(1,0)
    end
  end

end