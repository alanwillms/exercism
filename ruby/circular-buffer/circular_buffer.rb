class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def write(value)
    raise BufferFullException.new if @buffer.size == @size
    @buffer.push value unless value.nil?
  end

  def write!(value)
    return if value.nil?
    read if @buffer.size == @size
    write value
  end

  def read
    raise BufferEmptyException.new if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end
end
