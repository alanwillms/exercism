class Deque
  def initialize
    @root = nil
  end

  def push(value)
    add_after_last :next, value
  end

  def unshift(value)
    add_after_last :prev, value
  end

  def pop
    take_last :next
  end

  def shift
    take_last :prev
  end

  private

  def add_after_last(direction, value)
    opposite_direction = (direction == :next) ? :prev : :next
    direction_setter = "#{direction}=".to_sym
    opposite_direction_setter = "#{opposite_direction}=".to_sym

    if @root
      element = @root
      element = element.send(direction) while element.send(direction)
      element.send direction_setter, Element.new(value)
      element.send(direction).send(opposite_direction_setter, element)
    else
      @root = Element.new(value)
    end
  end

  def take_last(direction)
    opposite_direction = (direction == :next) ? :prev : :next
    direction_setter = "#{direction}=".to_sym
    element = @root
    element = element.send(direction) while element.send(direction)
    element.send(opposite_direction).send(direction_setter, nil) if element.send(opposite_direction)
    @root = element.send(opposite_direction) if element == @root
    element.value
  end
end

class Element
  attr_accessor :next, :prev
  attr_reader :value

  def initialize(value)
    @value = value
  end
end
