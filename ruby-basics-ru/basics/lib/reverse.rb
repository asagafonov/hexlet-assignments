# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str.split('').each { |char| result = "#{char}#{result}" }
  result
end
# END
