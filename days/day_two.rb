require_relative "utilities"

FILENAME = "input/day_two.txt"
DIRECTION_REGEX = /(?<dir>forward|down|up)\s(?<dist>\d+)/

def advanced_move(position, direction)
  parsed_direction = direction.match(DIRECTION_REGEX)
  return position unless parsed_direction
  case parsed_direction[:dir]
  when "forward"
    position[:horizontal] += parsed_direction[:dist].to_i
    position[:depth] += parsed_direction[:dist].to_i * position[:aim]
  when "down"
    position[:aim] += parsed_direction[:dist].to_i
  when "up"
    position[:aim] -= parsed_direction[:dist].to_i
  end
  position
end

def move(position, direction)
  parsed_direction = direction.match(DIRECTION_REGEX)
  return position unless parsed_direction
  case parsed_direction[:dir]
  when "forward"
    position[:horizontal] += parsed_direction[:dist].to_i
  when "down"
    position[:depth] += parsed_direction[:dist].to_i
  when "up"
    position[:depth] -= parsed_direction[:dist].to_i
  end
  position
end

def part_one
  location = position(file_as_strings(FILENAME))
  location[:horizontal] * location[:depth]
end

def part_two
  location = position(file_as_strings(FILENAME), :advanced_move)
  location[:horizontal] * location[:depth]
end

def position(input, move_function = :move)
  location = { horizontal: 0, depth: 0, aim: 0 }
  input.each do |direction|
    location = send(move_function, location, direction)
  end
  location
end
