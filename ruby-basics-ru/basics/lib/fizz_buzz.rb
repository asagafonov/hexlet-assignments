# frozen_string_literal: true

# BEGIN
# def fizz? num
#   (num % 3).zero?
# end

# def buzz? num
#   (num % 5).zero?
# end

# def fizz_buzz? num
#   fizz?(num) && buzz?(num)
# end

# def fizz_buzz(start, stop)
#   return if start > stop
#   result = []

#   start.upto(stop).each do |num|
#     if fizz_buzz? num
#       result << 'FizzBuzz'
#     elsif fizz? num
#       result << 'Fizz'
#     elsif buzz? num
#       result << 'Buzz'
#     else
#       result << num
#     end
#   end

#   result.join(' ')
# end

def fizz_buzz(start, stop)
  return if start > stop

  result = []
  start.upto stop do |num|
    divided_by_three = (num % 3).zero?
    divided_by_five = (num % 5).zero?

    fizz = divided_by_three ? 'Fizz' : ''
    buzz = divided_by_five ? 'Buzz' : ''

    result << fizz.empty? && buzz.empty? ? num.to_s : "#{fizz}#{buzz}"
  end

  result.join(' ')
end
# END
