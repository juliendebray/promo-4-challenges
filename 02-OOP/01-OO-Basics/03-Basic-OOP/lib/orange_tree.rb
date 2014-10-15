class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :height, :age, :dead, :fruits

  def initialize
    @height = 0
    @age = 0
    @fruits = 0
    @dead = false
  end

  def dead?
    @dead
  end

  def one_year_passes!
    @age += 1
    # Growth
    @height += 1 if @age <= 10

    # Death
    @dead = true if @age >= 100
    @dead = true if (@age > 50) && (@age < 100) && (rand > 0.5)

    # Fruits production
    if (@age > 5) && (@age <= 10)
      @fruits = 100
    elsif (@age > 10) && (@age <= 15)
      @fruits = 200
    else
      @fruits = 0
    end
  end

  def pick_a_fruit!
    @fruits -= 1
  end
end