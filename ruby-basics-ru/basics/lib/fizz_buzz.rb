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

def divided_by?(num, divider)
  (num % divider).zero?
end

def fizz_buzz(start, stop)
  return if start > stop

  result = []
  start.upto stop do |num|
    fizz = divided_by?(num, 3) ? 'Fizz' : ''
    buzz = divided_by?(num, 5) ? 'Buzz' : ''

    word = fizz.empty? && buzz.empty? ? num.to_s : "#{fizz}#{buzz}"
    result << word
  end

  result.join(' ')
end
# END
