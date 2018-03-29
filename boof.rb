require 'wavefile'
include WaveFile

class Sine
  attr_reader :freq
  def initialize(freq)
    @freq = freq
  end
  
  def snapshot(sample_rate, sample_num)
    Math.sin(((2*Math::PI*freq)/sample_rate) * sample_num)
  end
  
  def samples(time_in_seconds, sample_rate)
    samples_list = (time_in_seconds * sample_rate).round
    samples_list.times.map { |x| snapshot(sample_rate, x) }
  end
end

SAMPLE_RATE = 441000
CHANNEL = :mono

a440 = Sine.new(440)
format = Format.new(CHANNEL, :float, SAMPLE_RATE)

# Buffer :: [Samples] -> Format -> BufferObject
# buff = Buffer.new(a440, format)

Writer.new('poop.wav', Format.new(CHANNEL, :pcm_16, SAMPLE_RATE )) do |writer|
  writer.write(Buffer.new(a440.samples(2,SAMPLE_RATE), format))
end

