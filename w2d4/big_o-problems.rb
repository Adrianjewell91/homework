#big o problems, writing problems with different time complexities.

require "byebug"
#compare the length of one element to the lengths of all elements, and
#swap the longest element if the element being tested is longest.

def n_squared_longest_fish(arr)

  #why is this n^2? how many steps in the worst case scenario?
  #how many steps? n * n.

  longest = arr[0]

  arr.each_index do |idx|
    test_arr = arr[0...idx] + arr[idx+1..-1]

    test_arr.each do |test_fish|
      longest = test_fish if test_fish.length > longest.length
    end
  end

  longest

end


def n_log_n_longest_fish(arr) #merge sort then return the largest array
  merge_sort(arr).last
end

  def merge_sort(arr)
    return arr if arr.length <= 1
    midpoint = arr.length / 2

    left = merge_sort(arr.take(midpoint))
    right = merge_sort(arr.drop(midpoint))
    # debugger
    merge(left,right)
  end

def merge(left, right)
  merged = []
# debugger
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged + left + right
end

def oh_n_longest_fish(arr)
  longest = arr.first
  arr[1..-1].each do |el|
    longest = el if el.length > longest.length
  end
  longest
end


test_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh','asdfasdfasdfasdfasdfasdfasdfasdfasdf','fsh', 'fiiiissshhhhhh',]

p n_squared_longest_fish(test_arr)
p n_log_n_longest_fish(test_arr)
p oh_n_longest_fish(test_arr)


##Dancing octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(step, tiles_array)
  #tell me what is the first index of the the step.
  tiles_array.index(step)
end

p slow_dance("up", tiles_array) #==> 0
p slow_dance("right",tiles_array) #=>2
p slow_dance("right-down",tiles_array) #=3

better_tiles_array = {"up" => 0,
                      "right-up"=>1,
                      "right"=>2,
                      "right-down"=>3,
                      "down"=>4,
                      "left-down"=>5,
                      "left"=>6,
                      "left-up"=>7 }

def constant_dance(step, tiles_array)
  tiles_array[step]
end

p constant_dance("up", better_tiles_array) #==> 0
p constant_dance("right",better_tiles_array) #=>2
p constant_dance("right-down",better_tiles_array) #=3
