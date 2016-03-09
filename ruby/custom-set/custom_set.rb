class CustomSet
  attr_reader :items

  def initialize(items = [])
    @items = items.dup.sort.uniq
  end

  def disjoint?(other)
    other.items.each { |item| return false if member? item }
    true
  end

  def subset?(other)
    other.items.each { |item| return false unless member? item }
    true
  end

  def put(value)
    self.class.new(items.dup + [value])
  end

  def union(other)
    set = self
    other.items.each { |item| set = set.put(item) }
    set
  end

  def empty
    self.class.new
  end

  def size
    items.size
  end

  def to_a
    items
  end

  def member?(value)
    index = items.index(value)
    index && items[index].class == value.class
  end

  def intersection(other)
    shared = other.items.select { |item| member? item }
    self.class.new(shared)
  end

  def delete(value)
    items = self.items.dup
    items.delete(value) if member? value
    self.class.new(items)
  end

  def difference(other)
    set = self
    other.items.each { |item| set = set.delete(item) }
    set
  end

  def ==(other)
    items == other.items
  end
end
