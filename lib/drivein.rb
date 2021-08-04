class Drivein
  attr_reader :name, :vehicles

  def initialize(name)
    @name     = name
    @vehicles = []
  end

  def park_vehicle(vehicle)
    @vehicles << vehicle
  end

  def vehicles_with_multiple_passengers
    @vehicles.select do |vehicle|
      vehicle.passengers.length > 1
    end
  end

  def passengers_under_18
    @vehicles.flat_map do |vehicle|
      vehicle.passengers.select do |passenger|
        passenger.adult? == false
    end
  end
end
