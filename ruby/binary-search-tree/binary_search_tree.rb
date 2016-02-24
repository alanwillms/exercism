class Bst
  include Enumerable
  attr_reader :left, :right, :data

  def initialize(data)
    @data = data
  end

  def insert(number)
    if number <= data
      if left
        left.insert(number)
      else
        @left = self.class.new(number)
      end
    else
      if right
        right.insert(number)
      else
        @right = self.class.new(number)
      end
    end
  end

  def each(&block)
    left.each &block if left
    [data].each &block
    right.each &block if right
  end
end
