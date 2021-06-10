require 'rspec'
require './lib/passenger'

RSpec.describe Passenger do
  describe 'iteration 1' do
    before :each do
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end

    it 'exists' do
      expect(@charlie).to be_a(Passenger)
      expect(@taylor).to be_a(Passenger)
    end

    it 'initializes with attributes' do
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
    end

    it 'can determine if the person is an adult' do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end

    it 'can determine if the person is the driver' do
      expect(@charlie.driver?).to eq(false)

      @charlie.drive

      expect(@charlie.driver?).to eq(true)
    end
  end
end
