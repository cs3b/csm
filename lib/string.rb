class String

  def wrap(width, hanging_indent = 0, magic_lists = false)
    lines = self.split(/\n/)

    lines.collect! do |line|

      if magic_lists
        line =~ /^([\s\-\d\.\:]*\s)/
      else
        line =~ /^([\s]*\s)/
      end

      indent = $1.length + hanging_indent rescue hanging_indent

      buffer = ""
      first = true

      while line.length > 0
        first ? (i, first = 0, false) : i = indent
        pos = width - i

        if line.length > pos and line[0..pos] =~ /^(.+)\s/
          subline = $1
        else
          subline = line[0..pos]
        end
        buffer += " " * i + subline + "\n"
        line.tail!(subline.length)
      end
      buffer[0..-2]
    end

    lines.join("\n")

  end

  def tail!(pos)
    self[0..pos] = ""
    strip!
  end

end

if __FILE__ == $0
  File.open(ARGV[0]) do |f|
    puts f.read.wrap(ARGV[1].to_i, ARGV[2].to_i, ARGV[3] == "true")
  end
end
