# Crystal version of bench. programs in
# https://github.com/Armando284/nodejs-vs-go-sorting-algorithms/
module Crystal::Merge::Benchmark
  VERSION = "0.1.0"

  def self.load_array_data
    file = File.new("./file.json", encoding: "UTF8")
    content = file.gets_to_end
    file.close

    puts content
  rescue ex
    puts "Reading file error:", ex
  end

  # BUBBLE SORT
  def self.bubble_sort(array)
    #  Outer pass
    array.each_with_index do |el1, i|
      # Inner pass
      j = 0
      while j < array.size - i - 1
        # Comparing values in ascending order
        if array[j + 1] < array[j]
          # Swapping values
          array[j + 1], array[j] = [array[j], array[j + 1]]
        end
        j += 1
      end
      array
    end
  end
end

Crystal::Merge::Benchmark.load_array_data

array = [123123, 3213, 2112, 43, 2, 21, 1, 3, 412, 122323, 1111111111, 23, 55, 6]
Crystal::Merge::Benchmark.bubble_sort(array)

puts array
