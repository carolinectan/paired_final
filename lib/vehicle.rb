class Vehicle
  attr_reader :year, :make, :model, :passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @passengers = []
    @speed = false
  end

  def speed
    @speed = true
  end

  def speeding?
    @speed
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.select do |passenger|
      passenger.adult?
    end.length
  end
end
