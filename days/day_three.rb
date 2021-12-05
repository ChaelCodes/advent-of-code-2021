require_relative "utilities"

FILENAME = "input/day_three.txt"

def epsilon_rate(gamma_rate)
  gamma_rate.tr('01', '10')
end

def gamma_rate(diagnostic_report)
  diagnostic_report.first.length.times.map do |i|
    most_common_for(diagnostic_report, i)
  end.join
end

def common_for(diagnostic_report, position, &check)
  total = diagnostic_report.count
  ones_count = diagnostic_report.map { |value| value[position] }.count { |x| x == "1" }
  yield(ones_count, total) ? '1' : '0'
end

def most_common_for(diagnostic_report, position)
  common_for(diagnostic_report, position) { |ones_count, total|  ones_count * 2 >= total }
end

def least_common_for(diagnostic_report, position)
  common_for(diagnostic_report, position) { |ones_count, total|  ones_count * 2 < total }
end

def oxygen_generator_rating(diagnostic_report, position = 0)
  return diagnostic_report.first if diagnostic_report.count == 1
  string_start = diagnostic_report.first.slice(0, position)
  num = most_common_for(diagnostic_report, position)
  report = diagnostic_report.grep(/^#{string_start}#{num}/)
  oxygen_generator_rating(report, position + 1)
end

def co2_scrubber_rating(diagnostic_report, position = 0)
  return diagnostic_report.first if diagnostic_report.count == 1
  string_start = diagnostic_report.first.slice(0, position)
  num = least_common_for(diagnostic_report, position)
  report = diagnostic_report.grep(/^#{string_start}#{num}/)
  co2_scrubber_rating(report, position + 1)
end

def part_one
  g_rate = gamma_rate(file_as_strings(FILENAME))
  e_rate = epsilon_rate(g_rate)
  g_rate.to_i(2) * e_rate.to_i(2)
end

def part_two
  co2_rate = co2_scrubber_rating(file_as_strings(FILENAME))
  o_rate = oxygen_generator_rating(file_as_strings(FILENAME))
  o_rate.to_i(2) * co2_rate.to_i(2)
end
