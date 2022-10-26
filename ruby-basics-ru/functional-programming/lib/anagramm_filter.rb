# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, anagramms)
  sorted = word.chars.sort.join
  anagramms.filter { |el| el.chars.sort.join == sorted }
end
# END
