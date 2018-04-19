module OSC
  class OSCArgs
    def initialize(val) @val = val end
    attr_reader :val
    
    def to_i() val.to_i end
    def to_s() val.to_s end
    def to_f() val.to_f end
  end
end