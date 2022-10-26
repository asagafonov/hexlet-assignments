# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users
    .filter { |user| user[:gender] == 'male' }
    .map { |user| user[:birthday][0...4] }
    .each_with_object({}) do |year, acc|
      acc[year] ||= 0
      acc[year] += 1
    end
end
# END
