class ForthR
  def initialize
    @stack = []
    @output = []
    @words = {
      ".s"   => lambda { @output << @stack.join(" ") },
      "."    => lambda { @stack.pop }, 
      "dup"  => lambda { @stack << @stack.last}, 
    }
  end

  def <<(line)
    tokenize(line).each do |command|
      if @words[command]
        @words[command].call
      else
        @stack << command
      end
    end
  end

  def output
    @output.join("\n")
  end

  def size
    @stack.size
  end

  def tokenize(line)
    line.split(" ").map {|word| word.downcase }
  end
end
