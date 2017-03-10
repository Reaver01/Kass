def load_json(file_location)
  if File.exist?(file_location)
    begin
      ar = {}
      ar = JSON.parse File.read file_location
    rescue
      ar = {}
    end
  else
    ar = {}
  end
  ar
end

def getline(loc, line)
  if File.exist?(loc)
    f = File.open(loc, 'r')
    line.times { f.gets }
    $temp = $LAST_READ_LINE
    f.close
    $temp
  else
    puts 'No file to open!'
  end
end
