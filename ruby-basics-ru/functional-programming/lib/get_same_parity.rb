# frozen_string_literal: true

# BEGIN
def get_same_parity(numbers)
  return [] if numbers.empty?

  numbers.first.odd? ? numbers.filter(&:odd?) : numbers.filter(&:even?)
end
# END
