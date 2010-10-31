class HashParser

  attr_accessor :parse_string

  def condense_string
    parse_string.gsub!(/\s=>\s/,'=>')
  end

  def strip_string
    parse_string.gsub!(/[{}":]/,'')
  end

  def parse
    hash = {}
    condense_string
    strip_string

    parse_string.split(',').each do |pairs|
      key_value = pairs.strip.split('=>')
      hash[key_value[0]] = key_value[1]
    end
    hash
  end

end
