class Stack
  def initialize(stack = [])
    @stack = stack
  end

  def remove
    p "removed: #{@stack.pop}"
    "Stack: #{@stack}"
  end

  def add(n)
    @stack << n
  end

  def show
    @stack
  end
end


if $PROGRAM_NAME == __FILE__
  s = Stack.new([1,2,3])
  p  s.remove #
  p  s.add(10)
  p  s.add(100)
  p  s.remove
  p  s.remove
  p  s.remove
  p  s.show
end
