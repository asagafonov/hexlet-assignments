# frozen_string_literal: true

require 'date'

# BEGIN
module Model
  def initialize(attrs = {})
    attrs.each do |(key, val)|
      instance_variable_set "@#{key}", transform_to_type(val, define_type(val))

      define_singleton_method key do
        instance_variable_get "@#{key}"
      end

      define_singleton_method "#{key}=" do
        instance_variable_set "@#{key}", transform_to_type(val, define_type(val))
      end
    end
  end

  def attribute(name, options = {})
    define_method name do
      instance_variable_get "@#{name}"
    end

    define_method "#{name}=" do |value|
      instance_variable_set "@#{name}", transform_to_type(value, options[:type])
    end
  end

  def attributes
    instance_variables.each_with_object({}) do |key, acc|
      acc[key.to_s[1..].to_sym] = instance_variable_get(key)
    end
  end

  private

  def transform_to_type(val, type = nil)
    return val unless type

    case type
    when :string then val.to_s
    when :datetime then DateTime.parse(val)
    when :boolean then to_bool(val)
    when :integer then val.to_i
    end
  end

  def define_type(val)
    if val.instance_of?(String)
      return valid_datestring?(val) ? :datetime : :string
    end
    return :integer if val.instance_of?(Integer)
    return :boolean if !!val == val
  end

  def to_bool(val)
    return true if val.to_s == 'true'
    return false if val.to_s == 'false'
  end

  def valid_datestring?(val)
    %r{(\d+)/(\d+)/(\d+)}.match?(val)
  end
end
# END
