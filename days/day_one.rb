require_relative "utilities"

FILENAME = "input/day_one.txt"

def count_increasing(depth_measurements)
  depth_measurements.each_cons(2).count do |a, b|
    a < b
  end
end

def count_summary_increasing(depth_measurements)
  count_increasing(summary(depth_measurements))
end

def part_one
  count_increasing(file_as_integers(FILENAME))
end

def part_two
  count_summary_increasing(file_as_integers(FILENAME))
end

def summary(depth_measurements)
  depth_measurements.each_cons(3).map(&:sum)
end
