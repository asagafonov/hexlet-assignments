# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  text.split.map { |word| stop_words.include?(word) ? '$#%!' : word }.join(' ')
  # END
end
