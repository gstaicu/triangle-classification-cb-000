require 'pry'

class Triangle
  # write code here
  def initialize(lat_a, lat_b, lat_c)
    @lat_a = lat_a
    @lat_b = lat_b
    @lat_c = lat_c
  end

  def compare_lat(a, b, c)
    sort_lat = [a, b, c].sort!
    sort_lat[-1] >= sort_lat[-2] + sort_lat[-3]
  end

  def kind
    if ![@lat_a, @lat_b, @lat_c].all? { |e| e.class == Fixnum || e.class == Float }
      raise TriangleError
    elsif [@lat_a, @lat_b, @lat_c].any? { |e| e <= 0 }
      raise TriangleError
    elsif compare_lat(@lat_a, @lat_b, @lat_c)
      raise TriangleError
    else
      if (@lat_a == @lat_b) && (@lat_b == @lat_c)
        :equilateral
      elsif (@lat_a == @lat_b) || (@lat_a == @lat_c) || (@lat_b == @lat_c)
        :isosceles
      else
      	:scalene
      end
    end
  end

end

class TriangleError < StandardError
  def message
    'there is not a valid triangle'
  end
end

#puts Triangle.new(2, 2, 2).kind
#
#binding.pry
#puts 'debug'
