class BinarySearch
  attr_reader :list

  def initialize(list)
    @list = list.is_a?(Hash) ? list : Hash[(0...list.size).zip list]
    raise ArgumentError.new('Inform a sorted list') if @list.values.sort != @list.values
  end

  def list
    @list.values
  end

  def search_for(number)
    position = middle

    if @list.keys.size > 0 && @list[position] != number
      new_list = if @list[position] < number
        @list.select { |k, v| k > position }
      else
        @list.select { |k, v| k < position }
      end
      return BinarySearch.new(new_list).search_for(number)
    end

    raise RuntimeError.new('Number not found') if @list[position] != number

    position
  end

  def middle
    @list.keys[@list.keys.size / 2]
  end
end

# Disable cheating
class Array
  def index(value)
    raise RuntimeError.new('You are cheating!')
  end
end
