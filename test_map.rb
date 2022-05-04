
my_array = [1,2,3,4,5]

mappped_array = my_array.map { |e|

  "mapped value: #{1 + 100}"
}

puts "origin array: #{my_array.inspect}"
puts "mapped array: #{mappped_array.inspect}"
