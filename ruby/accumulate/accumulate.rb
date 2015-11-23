class Array
  def accumulate
    self.map { |item| yield item }
  end
end
