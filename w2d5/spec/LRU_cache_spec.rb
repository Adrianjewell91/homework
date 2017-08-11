require 'rspec'
require "LRU_Cache"

describe "LRUCache" do
  subject(:cache) { LRUCache.new(4) }
  describe "#initialize" do
    it "should set the length of the cache to the number specified" do
      expect(cache.cache.length).to eq(4)
    end

    it "should set a default value to four" do
      expect(LRUCache.new.cache.length).to eq(3)
    end
  end

  describe "#add" do
    let (:almost_filled_cache) { LRUCache.new(3) }

    before(:each) do
      almost_filled_cache.add(:first)
      almost_filled_cache.add(:second)
      almost_filled_cache.add(:third)
    end

    context "when adding a new element" do
      it "should shovel a new element to the end of the cache" do
        expect(almost_filled_cache.cache[2]).to eq(:third)
      end

      it "should pop an element if the size has reached its limit" do
        almost_filled_cache.add(:fourth)
        expect(almost_filled_cache.cache).not_to include(:first)
      end
    end

    context "when adding a pre-existing element" do
      it "should put a pre-existing element into the end of the cache" do
        almost_filled_cache.add(:second)
        expect(almost_filled_cache.cache[-1]).to eq(:second)
      end
    end
  end

  describe "#count" do
    let (:a_cache) { LRUCache.new(3)}

    it "should return the number of elements in the cache" do
      a_cache.add(1)
      a_cache.add(2)
      a_cache.add(3)

      expect(a_cache.count).to eq(3)
    end
  end

  describe "#the LRU cache" do
    it "should generally be a boss" do
      johnny_cache = LRUCache.new(4)

      johnny_cache.add("I walk the line")
      johnny_cache.add(5)

      johnny_cache.count # => returns 2

      johnny_cache.add([1,2,3])
      johnny_cache.add(5)
      johnny_cache.add(-5)
      johnny_cache.add({a: 1, b: 2, c: 3})
      johnny_cache.add([1,2,3,4])
      johnny_cache.add("I walk the line")
      johnny_cache.add(:ring_of_fire)
      johnny_cache.add("I walk the line")
      johnny_cache.add({a: 1, b: 2, c: 3})

      expect(johnny_cache.show).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
    end
  end
end
