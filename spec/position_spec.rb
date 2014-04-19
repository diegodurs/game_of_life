require 'position'

describe Position do
  describe '#surrounding_indexes' do
    it do
      expect(Position.new(1,1).surrounding_indexes).to eq \
        [[0,0],[0,1],[0,2],[2,0], [2,1], [2,2], [1,0],[1,2]]
    end
  end
  describe '#surrounding?' do
    it 'true on left' do
      expect(Position.new(0,1)).to be_surrounding(1,1)
    end
    it 'true on right' do
      expect(Position.new(2,1)).to be_surrounding(1,1)
    end
    it 'true on bottom' do
      expect(Position.new(1,0)).to be_surrounding(1,1)
    end
    it 'true on top' do
      expect(Position.new(1,2)).to be_surrounding(1,1)
    end
    it 'true on topleft' do
      expect(Position.new(0,2)).to be_surrounding(1,1)
    end
    it 'true on bottomleft' do
      expect(Position.new(0,0)).to be_surrounding(1,1)
    end
    it 'true on topright' do
      expect(Position.new(2,2)).to be_surrounding(1,1)
    end
    it 'true on topleft' do
      expect(Position.new(0,2)).to be_surrounding(1,1)
    end
    it 'false otherwise' do
      3.times do |i|
        expect(Position.new(3,i)).to_not be_surrounding(1,1)
        expect(Position.new(i,3)).to_not be_surrounding(1,1)
      end

    end
  end
end