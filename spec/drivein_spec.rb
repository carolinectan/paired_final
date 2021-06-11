require 'rspec'
require './lib/vehicle'
require './lib/passenger'
require './lib/drivein'

RSpec.describe Drivein do
  describe 'iteration 3' do
    before :each do
      @drivein1 = Drivein.new("Movies R Us")
      @drivein2 = Drivein.new("Regal Cinema")
      @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      @vehicle2 = Vehicle.new("2008", "Toyota", "FJ")
      @vehicle3 = Vehicle.new("2018", "Audi", "S5")
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      @jude = Passenger.new({"name" => "Jude", "age" => 20})
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      @johnny = Passenger.new({"name" => "Johnny", "age" => 38})
      @kelly = Passenger.new({"name" => "Kelly", "age" => 12})
      @melissa = Passenger.new({"name" => "Melissa", "age" => 7})

    end

    it 'exists' do
      expect(@drivein1).to be_a(Drivein)
      expect(@drivein2).to be_a(Drivein)
    end

    it 'initializes with attributes' do
      expect(@drivein1.name).to eq("Movies R Us")
      expect(@drivein1.vehicles).to eq([])
      expect(@drivein2.name).to eq("Regal Cinema")
      expect(@drivein2.vehicles).to eq([])
    end

    it 'can park vehicles' do
      @drivein1.park_vehicle(@vehicle1)
      expect(@drivein1.vehicles).to eq([@vehicle1])

      @drivein1.park_vehicle(@vehicle2)
      expect(@drivein1.vehicles).to eq([@vehicle1, @vehicle2])

      @drivein2.park_vehicle(@vehicle3)
      expect(@drivein2.vehicles).to eq([@vehicle3])
    end

    it 'can return all vehicles that have multiple passengers' do
      @drivein1.park_vehicle(@vehicle1)
      @drivein1.park_vehicle(@vehicle2)
      @vehicle1.add_passenger(@charlie)
      @vehicle1.add_passenger(@jude)
      @vehicle2.add_passenger(@taylor)

      expect(@drivein1.vehicles_with_multiple_passengers).to eq([@vehicle1])

      @drivein2.park_vehicle(@vehicle3)
      @vehicle3.add_passenger(@johnny)

      expect(@drivein2.vehicles_with_multiple_passengers).to eq([])

      @vehicle3.add_passenger(@kelly)
      @vehicle3.add_passenger(@melissa)

      expect(@drivein2.vehicles_with_multiple_passengers).to eq([@vehicle3])
    end

    it 'can return all passengers who are under 18' do
      @drivein1.park_vehicle(@vehicle1)
      @drivein1.park_vehicle(@vehicle2)
      @vehicle1.add_passenger(@charlie)
      @vehicle1.add_passenger(@jude)
      @vehicle2.add_passenger(@taylor)

      expect(@drivein1.passengers_under_18).to eq([@taylor])

      @drivein2.park_vehicle(@vehicle3)
      @vehicle3.add_passenger(@johnny)
      @vehicle3.add_passenger(@kelly)
      @vehicle3.add_passenger(@melissa)

      expect(@drivein2.passengers_under_18).to eq([@kelly, @melissa]) ##
    end
  end
end

## Iteration 3
# You have been contracted by the Big Movie Corporation to build a software system that can track cars entering drive-in movie lots. Specifically, they would like you to implement the following features:
#   1. Each drive-in has a name, as well as a way to read that data.
#   1. A drive-in can list all vehicles that parked there.
#   1. A drive-in can list all vehicles that have multiple passengers.
#   1. A drive-in can list all passengers who are under 18.
# Build upon your existing code from the first two iterations to implement this functionality.
