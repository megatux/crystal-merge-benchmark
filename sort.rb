require 'benchmark'
require 'json'

file_contents = File.read('./input.json')
data = JSON.parse(file_contents)

def bubble_sort(array)
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

    break if not swapped
  end

  array
end

result = []

puts Benchmark.measure {
  result = bubble_sort(data)
}

p result
