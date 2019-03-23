# frozen_string_literal: true

add = ->(x) { ->(y) { x + y } }

add3 = add.(3)

puts add3.(5)
puts add3.(10)
puts add3.(12)
