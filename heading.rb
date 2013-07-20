require 'tempfile'
require 'fileutils'

# count the number of hashes
def hash_number(line)

  count = 0

  line.each_char do |char|
    break if char != "#"
    count += 1
  end
  count
end

temp_file = Tempfile.new('foo')
nav_tag = '<nav id="insert_nav_document">'

temp_file.puts nav_tag
prev_hash_num = 0
skip = false
path = ARGV[0]

begin
  File.open(path, 'r') do |file|
    file.each_line do |line|

      hashes = hash_number(line)
      if hashes != 0

        while hashes > prev_hash_num
          temp_file.puts(%Q|#{" " * prev_hash_num * 2}<ul>|)
          prev_hash_num += 1
        end

        while hashes < prev_hash_num
          temp_file.puts(%Q|#{" " * (prev_hash_num - 1) * 2}</ul>|)
          prev_hash_num -= 1
        end
        temp_file.puts(%Q|#{" " * hashes * 2}<li><a href="##{line
                                                             .strip
                                                             .gsub(/^#+/, '')
                                                             .strip
                                                             .gsub(/(,|:)\s?/, '-')
                                                             .gsub(/ /, '-')
                                                             .downcase}">#{line
                                                                        .strip
                                                                        .gsub(/^#+/, '')
                                                                        .strip}</a></li>|)
      end
    end
  end

  while prev_hash_num != 0
    temp_file.puts(%Q|#{" " * (prev_hash_num - 1) * 2}</ul>|)
    prev_hash_num -= 1
  end

  temp_file.puts '</nav>'

  File.open(path, 'r') do |file|
    file.each_line do |line|

      # ignore <nav> and </nav> of previous run
      if line =~/#{nav_tag}/
        skip = true
      end

      if skip && line.strip !~ /<\/nav>/
          next
      elsif skip && line =~/\<\/nav\>/
        skip = false
        next
      end

      temp_file.puts line
    end
  end
  temp_file.rewind

  FileUtils.mv(temp_file.path, path)
ensure
  temp_file.close
  temp_file.unlink
end
