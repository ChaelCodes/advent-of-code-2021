def read_file(filename)
  File.read(filename)
end

def file_as_integers(filename)
  read_file(filename).split.map(&:to_i)
end
