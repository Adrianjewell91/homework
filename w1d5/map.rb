class Map
  def initialize(*map)
    @map ||= map
  end

  def assign(key,value)
    @map << [key,value]
  end

  def remove(key)
    idx = @map.index(find(key))
    @map.delete_at(idx)
  end

  def lookup(key)
    entry = find(key)
    "#{entry[0]}: #{entry[1]}"
  end

  def show
    @map.each do |el|
      puts "#{el[0]}: #{el[1]}"
    end
  end

  def find(key)
    @map.find{|el| el[0] == key}
  end
end


if __FILE__ == $PROGRAM_NAME
  m = Map.new(['happy','good'],['sad','okay'],
              ['surprised','a good place to be'])


  puts "Lookup happy"
  p m.lookup('happy')


  puts "Remove 'surprised' "
  m.remove('surprised')
  p m.show

  puts "Assign a new entry"
  m.assign('puzzled','keep trying')
  p m.show
end
