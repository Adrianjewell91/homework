class LRUCache
    attr_reader :cache

    def initialize(length = 3 )
       @cache = Array.new(length)
       @max_length = length
    end

    def count
      # returns number of elements currently in cache
      @cache.count {|el| !el.nil?}
    end

    def add(el)
      # adds element to cache according to LRU principle

      #which is: push it if it's new, move it to back if exists, and do no
      #exceed length
      if @cache.include?(el)
        to_the_front = @cache.delete_at(@cache.index(el))
        @cache << to_the_front
      elsif @cache.length == @max_length
          @cache.shift
          @cache << el
      else
          @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!
  end
