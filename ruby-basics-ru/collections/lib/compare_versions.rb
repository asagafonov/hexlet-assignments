# frozen_string_literal: true

# rubocop:disable Style/RedundantReturn

# BEGIN
def compare_versions(ver1, ver2)
  ver1_parts = ver1.split('.')
  ver2_parts = ver2.split('.')

  ver1_parts.length.times do |ind|
    val1 = ver1_parts[ind].to_i
    val2 = ver2_parts[ind].to_i
    return val1 <=> val2 if val1 != val2
  end

  return 0
end
# END

# rubocop:enable Style/RedundantReturn
