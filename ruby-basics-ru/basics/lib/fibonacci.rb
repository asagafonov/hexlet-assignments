# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return num if num.zero? || num == 1

  fibonacci(num - 1) + fibonacci(num - 2)
end
# END
