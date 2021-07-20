class Triangle
	attr_reader :a, :b, :c

	def initialize(a, b, c)
		@a = a
		@b = b
		@c = c
	end

	def sides
		[self.a, self.b, self.c]
	end

	def unique_sides
		self.sides.uniq.length
	end

	def valid?
		self.sides.min > 0 && self.triangle_inequality
	end

	def triangle_inequality
		sides = self.sides
		max_side = sides.max
		max_side_index = sides.index(max_side)
		sides.slice!(max_side_index)
		max_side < sides.sum
	end

	def kind
		if !self.valid?
			raise TriangleError
		else
			check_kind
		end
	end

	def check_kind
		case self.unique_sides
		when 1
			:equilateral
		when 2
			:isosceles
		else
			:scalene
		end
	end

	class TriangleError < StandardError
	end
end
