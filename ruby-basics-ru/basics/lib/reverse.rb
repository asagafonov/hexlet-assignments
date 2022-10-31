# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str.chars.each { |char| result = "#{char}#{result}" }
  result
end
# END
