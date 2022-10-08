# Crystal version of bench. programs in
# https://github.com/Armando284/nodejs-vs-go-sorting-algorithms/

require "json"
require "benchmark"

module Crystal::Merge::Benchmark
  VERSION = "0.1.0"

  def self.load_array_data
    file = File.new("./input.json", encoding: "UTF8")
    content = file.gets_to_end
    file.close
    Array(Int32).from_json(content)
  rescue ex
    puts "Reading file error:", ex
  end

  # BUBBLE SORT
  def self.bubble_sort(array)
    arr_len = array.size
    #  Outer pass
    arr_len.times do |i|
      # Inner pass
      j = 0
      while j < arr_len - i - 1
        # Comparing values in ascending order
        if array[j + 1] < array[j]
          # Swapping values
          array[j + 1], array[j] = array[j], array[j + 1]
        end
        j += 1
      end
    end
    array
  end

  # BUBBLE SORT
  def self.bubble_sort_b(array)
    #  Outer pass
    array.size.times do |i|
      # Inner pass
      j = 0
      while j < array.size - i - 1
        # Comparing values in ascending order
        if array[j + 1] < array[j]
          # Swapping values
          array[j + 1], array[j] = array[j], array[j + 1]
        end
        j += 1
      end
    end
    array
  end

  def self.bubble_sort_c(array)
    array_length = array.size
    return array if array_length <= 1

    loop do
      # we need to create a variable that will be checked so that we don't run into an infinite loop scenario.
      swapped = false

      # subtract one because Ruby arrays are zero-index based
      (array_length-1).times do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swapped = true
        end
      end

      break if !swapped
    end

    array
  end
end

data = Crystal::Merge::Benchmark.load_array_data
data2 = data.clone || [] of Int32
data3 = data.clone || [] of Int32
puts "starting..."

exit(255) unless data

puts Benchmark.measure {
  Crystal::Merge::Benchmark.bubble_sort(data)
}

puts Benchmark.measure {
  Crystal::Merge::Benchmark.bubble_sort_b(data2)
}

puts Benchmark.measure {
  Crystal::Merge::Benchmark.bubble_sort_c(data3)
}
# puts data
