class Scale
  def initialize(tonic, scale_name, intervals = nil)
    @tonic = tonic.capitalize
    @scale_name = scale_name
    @intervals = intervals
    @scale = FLAT_KEYS.include?(tonic) ? FLAT_CHROMATIC_SCALE : SHARP_CHROMATIC_SCALE
  end

  def name
    @name ||= "#{tonic} #{scale_name}"
  end

  def pitches
    return reorder_scale unless intervals
    last_note_index = 0
    intervals.chars.each_with_object([]) do |interval, scale|
      scale << reorder_scale[last_note_index]
      last_note_index += ASCENDING_INTERVALS.index(interval) + 1
    end
  end

  private

  ASCENDING_INTERVALS = %w(m M A)
  SHARP_CHROMATIC_SCALE = %w(C C# D D# E F F# G G# A A# B)
  FLAT_CHROMATIC_SCALE = %w(C Db D Eb E F Gb G Ab A Bb B)
  FLAT_KEYS = %w(F Bb Eb Ab Db Gb d g c f bb eb)

  attr_reader :tonic, :scale_name, :intervals, :scale

  def reorder_scale
    return scale if tonic == 'C'
    index = scale.index(tonic)
    scale[index..-1] + scale[0..index - 1]
  end
end
