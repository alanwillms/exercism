class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier
  end

  def to_s
    @items.each_index.map do |index|
      if next_item = @items[index + 1]
        current_item = @items[index]
        "For want of a #{current_item} the #{next_item} was lost."
      else
        first_item = [@qualifier, @items.first].compact.join(' ')
        "And all for the want of a #{first_item}."
      end
    end.join("\n")
  end
end
