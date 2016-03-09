class Robot
  attr_reader :bearing

  def initialize
    @x = 0
    @y = 0
    @bearing = :east
  end

  def orient(direction)
    raise ArgumentError.new('Invalid direction') unless [:east, :west, :north, :south].include? direction
    @bearing = direction
  end

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    case @bearing
      when :north then @y += 1
      when :east then @x += 1
      when :south then @y -= 1
      else @x -= 1
    end
  end

  def turn_right
    @bearing = case @bearing
      when :north then :east
      when :east then :south
      when :south then :west
      else :north
    end
  end

  def turn_left
    @bearing = case @bearing
      when :east then :north
      when :north then :west
      when :west then :south
      else :east
    end
  end
end

class Simulator
  def instructions(input)
    input.chars.map do |char|
      if char == 'L'
        :turn_left
      elsif char == 'R'
        :turn_right
      else
        :advance
      end
    end
  end

  def place(robot, x: 0, y: 0, direction: :east)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions)
    instructions(instructions).each { |instruction| robot.send(instruction) }
  end
end
