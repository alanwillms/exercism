class SecretHandshake
  def initialize(number)
    @binary = number.is_a?(Integer) ? ('%b' % number).to_i : 0
  end

  def commands
    binary_code = @binary
    binary_code -= 10000 if @binary > 10000
    commands = find_commands(binary_code)
    @binary > 10000 ? commands.reverse : commands
  end

  private

  def find_commands(binary_code)
    {
      1000 => 'jump',
      100 => 'close your eyes',
      10 => 'double blink',
      1 => 'wink',
    }.each.each_with_object([]) do |pair, commands|
      code, command = *pair
      if binary_code - code >= 0
        binary_code -= code
        commands.unshift command
      end
    end
  end
end
