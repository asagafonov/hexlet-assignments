# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_empty_on_init
    stack = Stack.new
    assert_empty(stack)
  end

  def test_to_array
    stack = Stack.new
    assert(stack.instance_of?(Array) == false)
    arr = stack.to_a
    assert(arr.instance_of?(Array) == true)
  end

  def test_size
    stack = Stack.new
    assert(stack.size.zero?)
    stack.push!(2)
    stack.push!(3)
    assert(stack.size == 2)
  end

  def test_add_remove
    stack = Stack.new
    stack.push!(2)
    stack.push!(3)
    stack.pop!
    assert(stack.size == 1)
    assert(stack.to_a[0] == 2)
  end

  def test_clear
    stack = Stack.new
    stack.push!(2)
    stack.clear!
    assert_empty(stack)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
