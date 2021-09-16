require 'pry'

class Triangle

  attr_accessor :length_1, :length_2, :length_3, :equilateral, :isosceles, :scalene, :sides

  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3
    @sides = [length_1, length_2, length_3].sort
  end

  def kind
    if @sides.any? { |v| v <= 0 }
       raise TriangleError
    end
    if @sides[0] + @sides[1] <= @sides[2]
      raise TriangleError
    end
    check_types
  end
   
  def check_types
    case @sides.uniq.size  
    when 1 then :equilateral
    when 2 then :isosceles
    else :scalene
    end
  end
 
  class TriangleError < StandardError
  end
end

