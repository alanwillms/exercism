class Array
  def keep(&block)
    kept = []
    self.each { |item| kept << item if block.call(item) }
    kept
  end

  def discard(&block)
    kept = []
    self.each { |item| kept << item unless block.call(item) }
    kept
  end
end
