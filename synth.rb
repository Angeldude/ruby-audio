require 'wavefile'
include WaveFile

class Sine
  attr_reader :freq
  def initialize(freq, sample_rate=44100)
    @freq = freq
	@sample_rate = sample_rate
  end
  
  def snapshot(sample_num)
    Math.sin(((2*Math::PI*freq)/@sample_rate) * sample_num)
  end
  
  def samples(time_in_seconds)
    samples_list = (time_in_seconds * @sample_rate).round
    samples_list.times.map{|samp| snapshot(samp)}
  end
end

SAMPLE_RATE = 2000
CHANNEL = :mono # :stereo

a440 = Sine.new(440, SAMPLE_RATE)
format = Format.new(CHANNEL, :float, SAMPLE_RATE)

# Buffer :: [Samples] -> Format -> BufferObject

Writer.new('audio.wav', Format.new(CHANNEL, :pcm_16, SAMPLE_RATE )) do |writer|
  writer.write(Buffer.new(a440.samples(3.5), format))
end

puts "File written!"