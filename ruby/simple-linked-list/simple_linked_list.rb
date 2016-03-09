class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  def initialize
    @items = []
  end

  def push(datum)
    @items.unshift Element.new(datum, @items.first)
  end

  def size
    @items.size
  end

  def empty?
    @items.empty?
  end

  def peek
    @items.first.datum if @items.first
  end

  def head
    @items.first
  end

  def pop
    @items.shift.datum
  end

  def to_a
    @items.map &:datum
  end

  def reverse
    self.class.from_a to_a.reverse
  end

  def self.from_a(items)
    return self.new unless items.is_a?(Array)
    items.reverse.each_with_object(self.new) { |item, list| list.push item }
  end
end
