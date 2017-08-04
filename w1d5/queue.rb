class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(n)
    @queue.unshift(n)
  end

  def dequeue
    @queue.pop
    show
  end

  def show
    @queue
  end
end

if $PROGRAM_NAME == __FILE__
  s = Queue.new([1,2,3])
  p  s.dequeue #
  p  s.enqueue(10)
  p  s.enqueue(100)
  p  s.dequeue
  p  s.dequeue
  p  s.dequeue
  p  s.show
end
