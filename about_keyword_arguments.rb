require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutKeywordArguments < Neo::Koan

  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  def test_keyword_arguments
    assert_equal Array, method_with_keyword_arguments.class
    assert_equal [1, 'two'], method_with_keyword_arguments
    assert_equal ['one', 'two'], method_with_keyword_arguments(one: 'one')
    assert_equal [1, 2], method_with_keyword_arguments(two: 2)
  end

  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_raise (ArgumentError) do
      method_with_keyword_arguments_with_mandatory_argument
    end
    assert_match(/wrong number of arguments/, exception.message)
  end

  # THINK ABOUT IT:
  #
  # Keyword arguments always have a default value, making them optional to the caller

end
# Keyword arguments vs positional arguments
#
# Assume we have a method with positional arguments:
# 
#     def mysterious_total(subtotal, tax, discount)
#       subtotal + tax - discount
#     end
# 
#     mysterious_total(100, 10, 5) # => 105
# 
# This method does its job, but as a reader of the code using the mysterious_total method, I have no idea what those arguments mean without looking up the implementation of the method.
# 
# By using keyword arguments, we know what the arguments mean without looking up the implementation of the called method:
# 
#     def obvious_total(subtotal:, tax:, discount:)
#       subtotal + tax - discount
#     end
# 
#     obvious_total(subtotal: 100, tax: 10, discount: 5) # => 105
# 
# Keyword arguments allow us to switch the order of the arguments, without affecting the behavior of the method:
# 
#     obvious_total(subtotal: 100, discount: 5, tax: 10) # => 105
# 
# If we switch the order of the positional arguments, we are not going to get the same results, giving our customers more of a discount than they deserve:
# 
#     mysterious_total(100, 5, 10) # => 95