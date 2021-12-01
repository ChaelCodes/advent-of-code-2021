require_relative "utilities"

FILENAME = "input/sample.txt"

def line_count
  read_file(FILENAME).split.count
end
