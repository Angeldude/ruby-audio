require_relative 'osc_args'

# OSC TYPES
module OSC
  class Int32 < OSCArgs
    def encode() [val].pack('N').force_encoding('BINARY') end 
    def tag() "i" end
  end
  
  class Float32 < OSCArgs
    def encode() [val].pack('g').force_encoding('BINARY') end
    def tag() "f" end
  end
  
  class OSCTimeTag < OSCArgs
    def encode() [val].pack('G').force_encoding('BINARY') end
    def tag() "d" end
  end
  
   class OSCString < OSCArgs
    # def encode() [val].pack('a') end
    def tag() "s" end
  end

end

one = OSC::OSCString.new('hiawwhata')

p one.encode