class Passenger
  attr_reader :name, :age

  def initialize(info)
    @name  = info['name']
    @age   = info['age']
    @drive = false
  end

  def adult? #considered an adult if they are age 18 or older
    if @age >= 18
      true
    else
      false
    end
  end

  def driver?
    @drive
  end

  def drive
    @drive = true
  end
end
