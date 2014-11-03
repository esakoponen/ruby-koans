# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # Make sure that the longest edge is shorter than the sum
  # of the two shorter edges.
  max_value = 0
  sum = 0
  [a, b, c].each do |i|
    sum += i
    if i > max_value then
      max_value = i
    end
  end

  if a <= 0 or b <= 0 or c <= 0 then
    raise TriangleError
  elsif sum - max_value <= max_value then
    raise TriangleError
  elsif a == b and b == c then
    :equilateral
  elsif a != b and a != c and b != c then
    :scalene
  else
    :isosceles
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
